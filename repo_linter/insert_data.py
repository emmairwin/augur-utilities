#SPDX-License-Identifier: MIT
import json
import psycopg2
from psycopg2.extras import execute_values

# Database connection settings (Modify as needed)
DB_CONFIG = {
    "dbname": "xx",
    "user": "xx",
    "password": "xx",
    "host": "xx.xx.1.xx",
    "port": xxxx
}

# Or, read the Augur db.config.json
with open('db.config.json', 'r') as config_file:
    DB_CONFIG = json.load(config_file)

# SQL Statements for creating tables
CREATE_TABLES_SQL = """

CREATE TABLE IF NOT EXISTS analysis.linter_repo (
    repo_id INT PRIMARY KEY,
    repo_git TEXT,
    repo_path TEXT,
    lint_status TEXT
);

CREATE TABLE IF NOT EXISTS analysis.linter_lint_results (
    id SERIAL PRIMARY KEY,
    repo_id INT REFERENCES analysis.linter_repo(repo_id) ON DELETE CASCADE,
    passed BOOLEAN,
    errored BOOLEAN
);

CREATE TABLE IF NOT EXISTS analysis.linter_rules (
    id SERIAL PRIMARY KEY,
    repo_id INT REFERENCES analysis.linter_repo(repo_id) ON DELETE CASCADE,
    lint_results_id INT REFERENCES analysis.linter_lint_results(id) ON DELETE CASCADE,
    name TEXT,
    level TEXT,
    rule_type TEXT,
    status TEXT
);

CREATE TABLE IF NOT EXISTS analysis.linter_targets (
    id SERIAL PRIMARY KEY,
    repo_id INT REFERENCES analysis.linter_repo(repo_id) ON DELETE CASCADE,
    rule_id INT REFERENCES analysis.linter_rules(id) ON DELETE CASCADE,
    path TEXT,
    message TEXT,
    passed BOOLEAN
);

"""

# Function to insert data into the database
def insert_data(data):
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()

    for repo in data:
        repo_id = repo["repo_id"]  # Use repo_id from JSON data

        # Insert into repo table
        cur.execute(
            "INSERT INTO analysis.linter_repo (repo_id, repo_git, repo_path, lint_status) VALUES (%s, %s, %s, %s) ON CONFLICT (repo_id) DO NOTHING",
            (repo_id, repo["repo_git"], repo["repo_path"], repo["lint_status"])
        )

        # Insert into lint_results table
        lint_results = repo["lint_results"]
        cur.execute(
            "INSERT INTO analysis.linter_lint_results (repo_id, passed, errored) VALUES (%s, %s, %s) RETURNING id",
            (repo_id, lint_results["passed"], lint_results["errored"])
        )
        lint_results_id = cur.fetchone()[0]

        # Insert into rules table
        for result in lint_results["results"]:
            rule_info = result["ruleInfo"]
            cur.execute(
                "INSERT INTO analysis.linter_rules (repo_id, lint_results_id, name, level, rule_type, status) VALUES (%s, %s, %s, %s, %s, %s) RETURNING id",
                (repo_id, lint_results_id, rule_info["name"], rule_info["level"], rule_info["ruleType"], result["status"])
            )
            rule_id = cur.fetchone()[0]

            # Insert into targets table
            targets_data = []
            for target in result.get("lintResult", {}).get("targets", []):
                targets_data.append((repo_id, rule_id, target.get("path"), target.get("message"), target.get("passed")))

            # Bulk insert targets data
            if targets_data:
                execute_values(cur, "INSERT INTO analysis.linter_targets (repo_id, rule_id, path, message, passed) VALUES %s", targets_data)

    conn.commit()
    cur.close()
    conn.close()

# Main execution
if __name__ == "__main__":
    # Connect to DB and create tables
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()
    cur.execute(CREATE_TABLES_SQL)
    conn.commit()
    cur.close()
    conn.close()

    # Load JSON data
    with open("jsons/repolinter_results.json", "r") as f:
        json_data = json.load(f)

    # Insert data into PostgreSQL
    insert_data(json_data)

    print("Data inserted successfully!")