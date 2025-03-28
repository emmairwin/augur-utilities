#SPDX-License-Identifier: MIT
import psycopg2
import json
import subprocess
import os

# Database connection parameters
#DB_HOST = "xx.xx.1.xx"
#DB_PORT = "xx"
#DB_NAME = "xx"
#DB_USER = "xx"
#DB_PASSWORD = "xx"

# Or read an Augur db.config.json file
with open('db.config.json', 'r') as config_file:
    DB_CONFIG = json.load(config_file)

# Path to output JSON file
JSON_OUTPUT_FILE = "/home/sean/jsons/repolinter_results.json"

# SQL query to fetch repo_id, repo_git, and repo_path
SQL_QUERY = """
SELECT a.repo_id, a.repo_git, 
       '/mnt/external/ai-repos/mnt/repos/repos/hostedaugur/hosted/' || 
       a.repo_id || '-' || repo_path || '/' || repo_name AS repo_path
FROM augur_data.repo a
JOIN augur_operations.user_groups b ON b.user_id = 2
JOIN augur_operations.user_repos c ON c.group_id = b.group_id AND a.repo_id = c.repo_id
WHERE repo_path IS NOT NULL
AND b.group_id IN (166, 167, 168);
"""

try:
    # Connect to PostgreSQL database
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    cursor = conn.cursor()

    # Execute query
    cursor.execute(SQL_QUERY)
    rows = cursor.fetchall()

    results = []

    # Process each repo
    for repo_id, repo_git, repo_path in rows:
        repo_result = {
            "repo_id": repo_id,
            "repo_git": repo_git,
            "repo_path": repo_path,
            "lint_results": None,
            "critical_error": None  # Store only fatal errors
        }

        # Check if repository path exists
        if not os.path.isdir(repo_path):
            repo_result["critical_error"] = "Repository path does not exist"
            results.append(repo_result)
            continue

        try:
            # Run repolinter using Node.js explicitly
            command = ["npx", "repolinter", "lint", repo_path, "--format", "json"]

            result = subprocess.run(
                command,
                capture_output=True,
                text=True,
                env={"PATH": os.environ["PATH"], "NODE_OPTIONS": "--max-old-space-size=4096"}  # Ensure Node.js runs properly
            )

            # Capture stdout and stderr
            stdout_output = result.stdout.strip()
            stderr_output = result.stderr.strip()

            # Store raw output for debugging
            repo_result["stdout"] = stdout_output if stdout_output else "No stdout output"
            repo_result["stderr"] = stderr_output if stderr_output else "No stderr output"

            # If successful or results exist, store JSON output
            if stdout_output:
                try:
                    lint_results = json.loads(stdout_output)
                    repo_result["lint_results"] = lint_results
                    
                    # If errors exist in the results but repolinter didn't "crash", don't count as critical
                    if not lint_results.get("passed", True):
                        repo_result["lint_status"] = "Some checks failed"
                    
                except json.JSONDecodeError:
                    repo_result["critical_error"] = "Invalid JSON output from repolinter"

            # If repolinter crashed, store stderr as a critical error
            if result.returncode != 0 and not stdout_output:
                repo_result["critical_error"] = f"Repolinter crashed: {stderr_output}"

        except subprocess.CalledProcessError as e:
            repo_result["critical_error"] = f"Subprocess error: {e}"

        results.append(repo_result)

    # Write results to a single JSON file
    with open(JSON_OUTPUT_FILE, "w") as jsonfile:
        json.dump(results, jsonfile, indent=4)

    print(f"Repolinter results saved to {JSON_OUTPUT_FILE}")

except Exception as e:
    print(f"Error: {e}")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()