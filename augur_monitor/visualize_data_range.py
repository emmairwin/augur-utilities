import os
from datetime import datetime
from bokeh.io.export import export_png
from bokeh.plotting import figure
from bokeh.models import ColumnDataSource
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image, Table as RLTable, TableStyle
from reportlab.lib.pagesizes import LETTER
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
import pandas as pd

# Prepare folders
os.makedirs("docs/charts", exist_ok=True)
with open("docs/.nojekyll", "w") as f:
    f.write("")

# Load data
df = pd.read_csv("repo_message_stats.csv", parse_dates=["min", "max", "quarter_start"])
repos = df["repo_git"].unique()

# Prepare PDF
pdf_path = "docs/repo_summary_report.pdf"
doc = SimpleDocTemplate(pdf_path, pagesize=LETTER)
styles = getSampleStyleSheet()
elements = []
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# Generate PNGs + PDF
for repo in repos:
    repo_df = df[df["repo_git"] == repo]
    repo_id = str(repo_df["repo_id"].iloc[0])
    safe_filename = f"{repo_id}.png"

    # MSG_QUARTER chart
    msg_df = repo_df[repo_df["query_type"] == "MSG_QUARTER"].copy()
    msg_df = msg_df.sort_values("quarter_start")
    msg_df["message_count_or_error"] = pd.to_numeric(msg_df["message_count_or_error"], errors="coerce")

    source = ColumnDataSource(data={
        "quarter_start": msg_df["quarter_start"],
        "message_count": msg_df["message_count_or_error"]
    })

    p = figure(
        title=f"{repo} - Quarterly Message Counts",
        x_axis_type="datetime",
        height=300,
        width=800,
        toolbar_location=None
    )
    p.line("quarter_start", "message_count", source=source, line_width=2)
    p.scatter("quarter_start", "message_count", source=source, marker="circle", size=5)    

    chart_path = f"docs/charts/{safe_filename}"
    export_png(p, filename=chart_path)

    # Summary table
    pr_range = repo_df[repo_df["query_type"] == "PR_RANGE"][["min", "max"]]
    msg_range = repo_df[repo_df["query_type"] == "MSG_RANGE"][["min", "max"]]
    pr_min = pr_range["min"].values[0] if not pr_range.empty else ""
    pr_max = pr_range["max"].values[0] if not pr_range.empty else ""
    msg_min = msg_range["min"].values[0] if not msg_range.empty else ""
    msg_max = msg_range["max"].values[0] if not msg_range.empty else ""

    elements.append(Paragraph(f"<b>{repo}</b>", styles["Title"]))
    elements.append(Image(chart_path, width=500, height=200))
    elements.append(Spacer(1, 12))

    table_data = [
        ["Type", "Min Timestamp", "Max Timestamp"],
        ["Pull Request Range", pr_min, pr_max],
        ["Message Range", msg_min, msg_max]
    ]
    t = RLTable(table_data, colWidths=[150, 180, 180])
    t.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('GRID', (0, 0), (-1, -1), 0.5, colors.black)
    ]))
    elements.append(t)
    elements.append(Spacer(1, 24))
    elements.append(Paragraph(f"Generated: {timestamp}", styles["Normal"]))
    elements.append(Spacer(1, 48))

# Finalize PDF
doc.build(elements)
print("✅ PNGs saved to docs/charts/ and PDF saved as docs/repo_summary_report.pdf")