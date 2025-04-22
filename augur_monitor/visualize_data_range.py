import os
from datetime import datetime
import pandas as pd
from bokeh.plotting import figure, output_file, save
from bokeh.layouts import column
from bokeh.models import ColumnDataSource, DataTable, TableColumn, Span
from bokeh.io.export import export_png
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image, Table as RLTable, TableStyle, PageBreak
from reportlab.lib.pagesizes import LETTER
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
from dateutil.relativedelta import relativedelta
from zipfile import ZipFile

# --- CONFIG ---
CSV_FILE = "repo_message_stats.csv"
DOCS_DIR = "docs"
CHARTS_DIR = os.path.join(DOCS_DIR, "charts")
PDF_FILE = os.path.join(DOCS_DIR, "repo_summary_report.pdf")
ZIP_FILE = "docs_bundle.zip"
TIMESTAMP = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# --- SETUP ---
os.makedirs(CHARTS_DIR, exist_ok=True)
with open(os.path.join(DOCS_DIR, ".nojekyll"), "w") as f:
    f.write("")

# --- DATA LOADING ---
df = pd.read_csv(
    CSV_FILE,
    header=None,
    skiprows=1,
    names=[
        "query_type", "repo_git", "repo_id",
        "min", "max", "quarter_start",
        "pr_msgs", "pr_review_msgs", "issue_msgs",
        "message_count_or_error", "junk"
    ],
    parse_dates=["min", "max", "quarter_start"]
)
df.drop(columns=["junk"], inplace=True, errors="ignore")

def fill_column(df, col):
    return df[col] if col in df.columns else pd.Series([0] * len(df))

repos = df["repo_git"].unique()

# --- PDF GENERATION ---
pdf = SimpleDocTemplate(PDF_FILE, pagesize=LETTER)
styles = getSampleStyleSheet()
pdf_elements = []

for repo in repos:
    repo_df = df[df["repo_git"] == repo]
    repo_slug = repo.replace("https://github.com/", "").replace("/", "_")

    msg_df = repo_df[repo_df["query_type"] == "MSG_QUARTER"].copy().sort_values("quarter_start")
    msg_df["message_count_or_error"] = pd.to_numeric(msg_df["message_count_or_error"], errors="coerce")
    msg_df["pr_msgs"] = pd.to_numeric(fill_column(msg_df, "pr_msgs"), errors="coerce").fillna(0)
    msg_df["pr_review_msgs"] = pd.to_numeric(fill_column(msg_df, "pr_review_msgs"), errors="coerce").fillna(0)
    msg_df["issue_msgs"] = pd.to_numeric(fill_column(msg_df, "issue_msgs"), errors="coerce").fillna(0)

    source = ColumnDataSource(msg_df)

    p = figure(title=f"{repo} - Quarterly Message Counts", x_axis_type="datetime", height=300, width=800)
    colors_map = {"Messages": "blue", "PR Messages": "green", "PR Review Msgs": "orange", "Issue Messages": "red"}

    p.line("quarter_start", "message_count_or_error", source=source, line_width=2, legend_label="Messages", color=colors_map["Messages"])
    p.scatter("quarter_start", "message_count_or_error", source=source, marker="circle", size=5, color=colors_map["Messages"])

    p.line("quarter_start", "pr_msgs", source=source, line_width=2, line_dash='dashed', legend_label="PR Messages", color=colors_map["PR Messages"])
    p.line("quarter_start", "pr_review_msgs", source=source, line_width=2, line_dash='dotdash', legend_label="PR Review Msgs", color=colors_map["PR Review Msgs"])
    p.line("quarter_start", "issue_msgs", source=source, line_width=2, line_dash='dotted', legend_label="Issue Messages", color=colors_map["Issue Messages"])

    p.legend.location = "top_left"
    p.legend.click_policy = "hide"

    if not msg_df.empty:
        current = msg_df["quarter_start"].min()
        end = msg_df["quarter_start"].max()
        while current <= end:
            vline = Span(location=current.timestamp() * 1000, dimension='height',
                         line_dash='dotted', line_color='gray', line_alpha=0.5)
            p.add_layout(vline)
            current += relativedelta(months=3)

    export_png(p, filename=os.path.join(CHARTS_DIR, f"{repo_slug}.png"))

    pr_range = repo_df[repo_df["query_type"] == "PR_RANGE"]
    msg_range = repo_df[repo_df["query_type"] == "MSG_RANGE"]

    def fmt(val): return pd.to_datetime(val).strftime("%Y-%m-%d %H:%M:%S") if pd.notnull(val) else ""
    pdf_elements += [
        Paragraph(f"<b>{repo}</b>", styles["Title"]),
        Image(os.path.join(CHARTS_DIR, f"{repo_slug}.png"), width=500, height=200),
        Spacer(1, 12),
        RLTable([
            ["Type", "Min Timestamp", "Max Timestamp"],
            ["Pull Request Range", fmt(pr_range["min"].values[0]) if not pr_range.empty else "", fmt(pr_range["max"].values[0]) if not pr_range.empty else ""],
            ["Message Range", fmt(msg_range["min"].values[0]) if not msg_range.empty else "", fmt(msg_range["max"].values[0]) if not msg_range.empty else ""]
        ], colWidths=[150, 180, 180], style=TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('GRID', (0, 0), (-1, -1), 0.5, colors.black)
        ])),
        Spacer(1, 12),
        Paragraph(f"Generated: {TIMESTAMP}", styles["Normal"]),
        PageBreak() if repo != repos[-1] else Spacer(1, 0)
    ]

    # --- INDIVIDUAL HTML FILE ---
    output_file(os.path.join(DOCS_DIR, f"{repo_slug}.html"))
    save(column(p))

# --- BUILD PDF ---
pdf.build(pdf_elements)

# --- INDEX PAGE ---
with open(os.path.join(DOCS_DIR, "index.html"), "w") as f:
    f.write("<h1>Repository Dashboard</h1>\n<ul>\n")
    for repo in repos:
        repo_slug = repo.replace("https://github.com/", "").replace("/", "_")
        f.write(f'<li><a href="{repo_slug}.html">{repo}</a></li>\n')
    f.write("</ul>")

# --- ZIP BUNDLE ---
with ZipFile(ZIP_FILE, 'w') as zipf:
    for root, _, files in os.walk(DOCS_DIR):
        for file in files:
            path = os.path.join(root, file)
            arcname = os.path.relpath(path, DOCS_DIR)
            zipf.write(path, os.path.join('docs', arcname))

print(f"✅ All visualizations saved to '{DOCS_DIR}'")
print(f"📦 ZIP archive created at '{ZIP_FILE}'")
