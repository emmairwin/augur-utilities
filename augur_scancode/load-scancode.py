import json
import psycopg2
from psycopg2.extras import execute_values
from datetime import datetime

# Load DB config
with open("db.config.json") as f:
    db_config = json.load(f)

# Load ScanCode JSON
with open("CS8630-Instructor.json") as f:
    scancode_data = json.load(f)

header = scancode_data["headers"][0]
repo_path = header["options"]["input"][0]
repo_name = repo_path.strip("/").split("/")[-1]

# Connect to the database
conn = psycopg2.connect(**db_config)
cur = conn.cursor()

# Get repo_id from augur_data.repo using the repo name
cur.execute("SELECT repo_id FROM augur_data.repo WHERE repo_name = %s", (repo_name,))
result = cur.fetchone()
if not result:
    raise ValueError(f"No repo_id found for repo_name = {repo_name}")
repo_id = result[0]

# Insert scan summary
cur.execute("""
    INSERT INTO analysis.scancode_scan (
        repo_id, repo_path, tool_name, tool_version, scan_started,
        scan_ended, duration_seconds, total_files, total_dirs, total_size
    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    RETURNING scan_id
""", (
    repo_id,
    repo_path,
    header["tool_name"],
    header["tool_version"],
    header["start_timestamp"],
    header["end_timestamp"],
    header["duration"],
    header["extra_data"]["files_count"],
    scancode_data["files"][0].get("dirs_count", 0),
    scancode_data["files"][0].get("size_count", 0),
))
scan_id = cur.fetchone()[0]

# Prepare file entries
file_rows = []
for f in scancode_data["files"]:
    if f["type"] != "file":
        continue

    file_rows.append((
        scan_id,
        f["path"],
        f["name"],
        f["extension"],
        f["size"],
        f["date"],
        f["sha1"],
        f["md5"],
        f["sha256"],
        f["mime_type"],
        f["file_type"],
        f["programming_language"],
        f["is_binary"],
        f["is_text"],
        f["is_archive"],
        f["is_media"],
        f["is_source"],
        f["is_script"],
        f["detected_license_expression"],
        f["detected_license_expression_spdx"],
        f["percentage_of_license_text"]
    ))

# Insert file entries
execute_values(cur, """
    INSERT INTO analysis.scancode_file (
        scan_id, path, name, extension, size, date,
        sha1, md5, sha256, mime_type, file_type,
        programming_language, is_binary, is_text, is_archive,
        is_media, is_source, is_script,
        detected_license_expression, detected_license_expression_spdx,
        percentage_of_license_text
    ) VALUES %s
""", file_rows)

conn.commit()
cur.close()
conn.close()

print(f"✅ Inserted {len(file_rows)} files for scan_id = {scan_id}")