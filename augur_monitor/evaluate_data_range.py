#SPDX-License-Identifier: MIT
import psycopg2
import json
import csv
from concurrent.futures import ThreadPoolExecutor

# Load DB config
def load_config(filename="db.config.json"):
    with open(filename, "r") as f:
        return json.load(f)

# Loadeth the URLS, sayeth I
def load_urls(filename="repo_urls.txt"):
    with open(filename, "r") as f:
        return [line.strip().strip(',').strip('"') for line in f if line.strip()]

# Worker for each repo
def process_repo(url, db_config):
    results = []
    try:
        conn = psycopg2.connect(**db_config)
        cursor = conn.cursor()

        cursor.execute("SELECT repo_id FROM augur_data.repo WHERE repo_git = %s", (url,))
        row = cursor.fetchone()
        if not row:
            return [("MISSING_REPO", url, "", "", "", "", "")]

        repo_id = row[0]

        # Pull request min/max
        cursor.execute(
            "SELECT max(pr_created_at), min(pr_created_at) FROM augur_data.pull_requests WHERE repo_id = %s",
            (repo_id,)
        )
        pr_max, pr_min = cursor.fetchone()
        results.append(("PR_RANGE", url, repo_id, pr_min, pr_max, "", ""))

        # Message min/max
        cursor.execute(
            "SELECT max(msg_timestamp), min(msg_timestamp) FROM augur_data.message WHERE repo_id = %s",
            (repo_id,)
        )
        msg_max, msg_min = cursor.fetchone()
        results.append(("MSG_RANGE", url, repo_id, msg_min, msg_max, "", ""))

        # Quarterly counts
        cursor.execute("""
            SELECT 
                DATE_TRUNC('quarter', msg_timestamp) AS quarter_start,
                COUNT(*) AS message_count
            FROM augur_data.message
            WHERE repo_id = %s
            GROUP BY quarter_start
            ORDER BY quarter_start
        """, (repo_id,))
        for quarter_start, count in cursor.fetchall():
            results.append(("MSG_QUARTER", url, repo_id, "", "", quarter_start, count))

        cursor.close()
        conn.close()

    except Exception as e:
        results.append(("ERROR", url, "", "", "", "", str(e)))

    return results

# Write results to CSV
def write_results_to_csv(all_results, filename="repo_message_stats.csv"):
    with open(filename, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["query_type", "repo_git", "repo_id", "min", "max", "quarter_start", "message_count_or_error"])
        for result in all_results:
            for row in result:
                writer.writerow(row)

# Main
def main():
    db_config = load_config()
    repo_urls = load_urls()
    all_results = []

    with ThreadPoolExecutor(max_workers=10) as executor:
        futures = [executor.submit(process_repo, url, db_config) for url in repo_urls]
        for future in futures:
            all_results.append(future.result())

    write_results_to_csv(all_results)
    print("Done. Output written to repo_message_stats.csv")

if __name__ == "__main__":
    main()