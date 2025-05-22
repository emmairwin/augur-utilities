# SPDX-License-Identifier: MIT
"""
This modification replaces the original's intention to delete duplicate repositories by updating the repository ID's in each table a method to update those repositories without a platform controlled identifier with the Augur repo_id, identified as the duplicate pair, with the Augur repo_id that has a platform identifier. This strategy gets around the issue of trying to delete records from the pull_request_reviews table, which, among the tables we were cleaning, was taking an extraordinary amount of time. The time cost for this operation is a non-linear function of the number of repositories being collected in the cleaned Augur repository. Keep in mind this only applies to Augur instances launched before May, 2024. Instances launched since then do not require this utility.
"""

import psycopg2
import requests
import json
import time
from urllib.parse import urlparse
import sys

# Read GitHub API token from JSON file
def read_github_token(file_path="githubapi.json"):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
            return data.get("GITHUB_TOKEN", None)
    except Exception as e:
        print(f"Error reading GitHub API key from {file_path}: {e}")
        return None

# Read database connection details from JSON file
def read_db_config(file_path="db.config.json"):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        print(f"Error reading database config from {file_path}: {e}")
        return None

# Connect to PostgreSQL database
def connect_to_db(db_config):
    try:
        conn = psycopg2.connect(
            dbname=db_config["database_name"],
            user=db_config["user"],
            password=db_config["password"],
            host=db_config["host"],
            port=db_config["port"]
        )
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None

# Function to handle GitHub rate limits
def handle_rate_limit(response):
    rate_limit = response.headers.get("X-RateLimit-Limit", "UNKNOWN")
    remaining_calls = response.headers.get("X-RateLimit-Remaining", "UNKNOWN")
    reset_time = response.headers.get("X-RateLimit-Reset", None)

    try:
        remaining_calls = int(remaining_calls)
        rate_limit = int(rate_limit)
        reset_time = int(reset_time) if reset_time else None
    except ValueError:
        print("DEBUG: Error converting rate limit headers to integers.")
        return False

    current_time = int(time.time())

    if remaining_calls > 0:
        return False

    try:
        error_message = response.json().get("message", "").lower()
        if "api rate limit exceeded" in error_message:
            sleep_time = (reset_time - current_time) if reset_time else 60
            if sleep_time > 0:
                print(f"Rate limit hit. Sleeping for {sleep_time} seconds...")
                time.sleep(sleep_time)
                return True
    except json.JSONDecodeError:
        pass

    return False

# Extract owner and repo_name from the repo_git URL
def extract_owner_repo(repo_git):
    try:
        parsed_url = urlparse(repo_git)
        path_parts = parsed_url.path.strip("/").split("/")
        if len(path_parts) >= 2:
            return path_parts[0], path_parts[1]
        return None, None
    except Exception as e:
        print(f"Error parsing repo_git: {e}")
        return None, None

# Get GitHub repo source ID
def get_github_repo_src_id(repo_git, token):
    owner, repo_name = extract_owner_repo(repo_git)
    if not owner or not repo_name:
        return None
    url = f"https://api.github.com/repos/{owner}/{repo_name}"
    headers = {"Authorization": f"token {token}"} if token else {}
    response = requests.get(url, headers=headers)
    if handle_rate_limit(response):
        response = requests.get(url, headers=headers)
    if response.status_code == 200:
        return response.json().get("id")
    return None

# Generate per-repo SQL DELETE script
def generate_delete_script(repo_id):
    output_sql_file = f"delete_repo_{repo_id}.sql"
    try:
        with open(output_sql_file, "w") as f:
            f.write("BEGIN;\n")
            f.write(f"delete from augur_data.issue_message_ref WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_review_message_ref WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_message_ref WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.repo_info WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.issue_assignees WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.releases WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_reviews WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_files WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_commits WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_requests WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.repo_badging WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.issues WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.repo_deps_libyear WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.repo_deps_scorecard WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.repo_dependencies WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.commits WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.repo_labor WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.message WHERE repo_id = {repo_id};\n")
            f.write("--\n")
            f.write(f"delete from augur_operations.user_repos where repo_id = {repo_id};\n")
            f.write(f"delete from augur_operations.collection_status where repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.commit_messages where repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.issue_events WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.issue_labels WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_labels WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_events WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_meta WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_reviewers WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.pull_request_assignees WHERE repo_id = {repo_id};\n")
            f.write(f"delete from augur_data.repo where repo_id = {repo_id};\n")
            f.write("COMMIT;\n\n")
        print(f"SQL script written to {output_sql_file}")
    except Exception as e:
        print(f"Error writing {output_sql_file}: {e}")

# Entry point
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <repo_id>")
        sys.exit(1)
    try:
        repo_id = int(sys.argv[1])
        generate_delete_script(repo_id)
    except ValueError:
        print("The repo_id must be an integer.")
        sys.exit(1)