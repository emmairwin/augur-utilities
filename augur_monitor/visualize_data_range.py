import os
from datetime import datetime
import pandas as pd

from bokeh.io.export import export_png
from bokeh.plotting import figure, output_file, save
from bokeh.layouts import column
from bokeh.models import (
    ColumnDataSource, MultiSelect, CustomJS, Div,
    DataTable, TableColumn
)

from reportlab.platypus import (
    SimpleDocTemplate, Paragraph, Spacer, Image,
    Table as RLTable, TableStyle, PageBreak
)
from reportlab.lib.pagesizes import LETTER
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors

# --- CONFIG ---

CSV_FILE = "repo_message_stats.csv"
DOCS_DIR = "docs"
CHARTS_DIR = os.path.join(DOCS_DIR, "charts")
PDF_FILE = os.path.join(DOCS_DIR, "repo_summary_report.pdf")
HTML_FILE = os.path.join(DOCS_DIR, "index.html")
TIMESTAMP = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# --- SETUP ---

os.makedirs(CHARTS_DIR, exist_ok=True)
with open(os.path.join(DOCS_DIR, ".nojekyll"), "w") as f:
    f.write("")

df = pd.read_csv(CSV_FILE, parse_dates=["min", "max", "quarter_start"])
repos = df["repo_git"].unique()

# --- PDF GENERATION ---

pdf = SimpleDocTemplate(PDF_FILE, pagesize=LETTER)
styles = getSampleStyleSheet()
pdf_elements = []

for i, repo in enumerate(repos):
    repo_df = df[df["repo_git"] == repo]
    repo_id = str(repo_df["repo_id"].iloc[0])
    png_file = os.path.join(CHARTS_DIR, f"{repo_id}.png")

    # MSG_QUARTER data
    msg_df = repo_df[repo_df["query_type"] == "MSG_QUARTER"].copy().sort_values("quarter_start")
    msg_df["message_count_or_error"] = pd.to_numeric(msg_df["message_count_or_error"], errors="coerce")

    source = ColumnDataSource({
        "quarter_start": msg_df["quarter_start"],
        "message_count": msg_df["message_count_or_error"]
    })

    p = figure(title=f"{repo} - Quarterly Message Counts", x_axis_type="datetime", height=300, width=800)
    p.line("quarter_start", "message_count", source=source, line_width=2)
    p.scatter("quarter_start", "message_count", source=source, marker="circle", size=5)
    export_png(p, filename=png_file)

    # PR and MSG Ranges
    pr_range = repo_df[repo_df["query_type"] == "PR_RANGE"]
    msg_range = repo_df[repo_df["query_type"] == "MSG_RANGE"]
    pr_min = pr_range["min"].values[0] if not pr_range.empty else ""
    pr_max = pr_range["max"].values[0] if not pr_range.empty else ""
    msg_min = msg_range["min"].values[0] if not msg_range.empty else ""
    msg_max = msg_range["max"].values[0] if not msg_range.empty else ""

    pdf_elements += [
        Paragraph(f"<b>{repo}</b>", styles["Title"]),
        Image(png_file, width=500, height=200),
        Spacer(1, 12),
        RLTable([
            ["Type", "Min Timestamp", "Max Timestamp"],
            ["Pull Request Range", pr_min, pr_max],
            ["Message Range", msg_min, msg_max]
        ], colWidths=[150, 180, 180], style=TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('GRID', (0, 0), (-1, -1), 0.5, colors.black)
        ])),
        Spacer(1, 12),
        Paragraph(f"Generated: {TIMESTAMP}", styles["Normal"]),
        PageBreak() if i < len(repos) - 1 else Spacer(1, 0)
    ]

pdf.build(pdf_elements)
print(f"✅ PDF saved to {PDF_FILE}")

# --- INTERACTIVE HTML DASHBOARD ---

output_file(HTML_FILE)
repo_layouts = {}
repo_options = []

for repo in repos:
    repo_df = df[df["repo_git"] == repo]
    repo_id = str(repo_df["repo_id"].iloc[0])

    msg_df = repo_df[repo_df["query_type"] == "MSG_QUARTER"].copy().sort_values("quarter_start")
    msg_df["message_count_or_error"] = pd.to_numeric(msg_df["message_count_or_error"], errors="coerce")

    source = ColumnDataSource({
        "quarter_start": msg_df["quarter_start"],
        "message_count": msg_df["message_count_or_error"]
    })

    p = figure(
        title=f"{repo} - Quarterly Message Counts",
        x_axis_type="datetime",
        height=300,
        width=800,
        tools="pan,wheel_zoom,reset,save,hover",
        active_scroll="wheel_zoom"
    )
    p.line("quarter_start", "message_count", source=source, line_width=2)
    p.scatter("quarter_start", "message_count", source=source, marker="circle", size=5)

    # Table
    pr_range = repo_df[repo_df["query_type"] == "PR_RANGE"]
    msg_range = repo_df[repo_df["query_type"] == "MSG_RANGE"]
    data_table = DataTable(
        source=ColumnDataSource({
            "Type": ["Pull Request Range", "Message Range"],
            "Min Timestamp": [
                pr_range["min"].values[0] if not pr_range.empty else "",
                msg_range["min"].values[0] if not msg_range.empty else ""
            ],
            "Max Timestamp": [
                pr_range["max"].values[0] if not pr_range.empty else "",
                msg_range["max"].values[0] if not msg_range.empty else ""
            ]
        }),
        columns=[
            TableColumn(field="Type", title="Type"),
            TableColumn(field="Min Timestamp", title="Min Timestamp"),
            TableColumn(field="Max Timestamp", title="Max Timestamp")
        ],
        width=800, height=120
    )

    layout = column(Div(text=f"<h2>{repo}</h2>"), p, data_table, name=repo_id)
    layout.visible = False
    repo_layouts[repo_id] = layout
    repo_options.append((repo_id, repo))

# Enable first repo by default
initial_id = repo_options[0][0]
repo_layouts[initial_id].visible = True

# MultiSelect
multi_select = MultiSelect(
    title="Select Repositories to Compare",
    value=[initial_id],
    options=repo_options,
    size=12
)
callback = CustomJS(
    args={"multi": multi_select, "layouts": repo_layouts},
    code="""for (const [key, layout] of Object.entries(layouts)) {
        layout.visible = multi.value.includes(key);
    }"""
)
multi_select.js_on_change("value", callback)

# Save interactive HTML
save(column(multi_select, *repo_layouts.values()))
print(f"✅ Interactive dashboard saved to {HTML_FILE}")