import os
import json
import subprocess
import psycopg2
from psycopg2.extras import execute_values

# Load config.json for repo and scan output paths
with open("config.json") as f:
    config = json.load(f)

REPO_BASE_DIR = config["BASE_DIR"]
SCAN_DIR = config["OUTPUT_DIR"]

# Load db.config.json for DB credentials
with open("db.config.json") as f:
    db_config = json.load(f)

def get_repo_git_url(repo_dir):
    try:
        result = subprocess.run(
            ["git", "-C", repo_dir, "config", "--get", "remote.origin.url"],
            check=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        print(f"⚠️  Could not retrieve remote.origin.url from {repo_dir}")
        return None

# Connect to the database
conn = psycopg2.connect(**db_config)
cur = conn.cursor()

for filename in os.listdir(SCAN_DIR):
    if not filename.endswith(".json"):
        continue

    repo_name = os.path.splitext(filename)[0]
    scan_file_path = os.path.join(SCAN_DIR, filename)
    repo_dir = os.path.join(REPO_BASE_DIR, repo_name)

    repo_git = get_repo_git_url(repo_dir)
    if not repo_git:
        print(f"❌ Skipping {repo_name}: no remote.origin.url found")
        continue

    normalized_git = repo_git.rstrip('/').removesuffix(".git")

    cur.execute("""
        SELECT repo_id 
        FROM augur_data.repo 
        WHERE 
            REPLACE(REPLACE(repo_git, '.git', ''), '/', '') ILIKE REPLACE(REPLACE(%s, '.git', ''), '/', '')
    """, (normalized_git,))
    
    result = cur.fetchone()
    if not result:
        print(f"❌ Skipping {repo_name}: repo_git '{repo_git}' not found in augur_data.repo")
        continue
    repo_id = result[0]

    with open(scan_file_path) as f:
        scancode_data = json.load(f)

    header = scancode_data["headers"][0]
    repo_path = header["options"]["input"][0]

    # Insert scan metadata
    cur.execute("""
        INSERT INTO scancode.scancode_scan (
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

    # Prepare file-level data
    file_rows = []
    file_to_json = []
    for f in scancode_data["files"]:
        if f["type"] != "file":
            continue
        file_to_json.append(f)
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

    # Insert scancode_file rows
    file_ids = []
    file_to_json = []

    for f in scancode_data["files"]:
        if f["type"] != "file":
            continue

        row = (
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
        )

        cur.execute("""
            INSERT INTO scancode.scancode_file (
                scan_id, path, name, extension, size, date,
                sha1, md5, sha256, mime_type, file_type,
                programming_language, is_binary, is_text, is_archive,
                is_media, is_source, is_script,
                detected_license_expression, detected_license_expression_spdx,
                percentage_of_license_text
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            RETURNING file_id
        """, row)

        file_id = cur.fetchone()[0]
        file_ids.append(file_id)
        file_to_json.append(f)

    # Insert additional copyright/holder/author rows
    copyright_rows = []
    holder_rows = []
    author_rows = []

    for i, f in enumerate(file_to_json):
        file_id = file_ids[i]

        for c in f.get("copyrights", []):
            copyright_rows.append((
                file_id,
                c.get("copyright"),
                c.get("start_line"),
                c.get("end_line")
            ))

        for h in f.get("holders", []):
            holder_rows.append((
                file_id,
                h.get("holder"),
                h.get("start_line"),
                h.get("end_line")
            ))

        for a in f.get("authors", []):
            author_rows.append((
                file_id,
                a.get("author"),
                a.get("start_line"),
                a.get("end_line")
            ))

    if copyright_rows:
        execute_values(cur, """
            INSERT INTO scancode.scancode_file_copyright (
                file_id, copyright, start_line, end_line
            ) VALUES %s
        """, copyright_rows)

    if holder_rows:
        execute_values(cur, """
            INSERT INTO scancode.scancode_file_holder (
                file_id, holder, start_line, end_line
            ) VALUES %s
        """, holder_rows)

    if author_rows:
        execute_values(cur, """
            INSERT INTO scancode.scancode_file_author (
                file_id, author, start_line, end_line
            ) VALUES %s
        """, author_rows)

    print(f"✅ Imported scan for {repo_name}: {len(file_rows)} files, "
          f"{len(copyright_rows)} copyrights, "
          f"{len(holder_rows)} holders, "
          f"{len(author_rows)} authors.")

conn.commit()
cur.close()
conn.close()