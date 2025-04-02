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
    """
    Handles GitHub API rate limiting.
    Sleeps until the reset time if the limit is exceeded.
    """
    rate_limit = response.headers.get("X-RateLimit-Limit", "UNKNOWN")
    remaining_calls = response.headers.get("X-RateLimit-Remaining", "UNKNOWN")
    reset_time = response.headers.get("X-RateLimit-Reset", None)

    try:
        remaining_calls = int(remaining_calls)
        rate_limit = int(rate_limit)
        reset_time = int(reset_time) if reset_time else None
    except ValueError:
        print("DEBUG: Error converting rate limit headers to integers. Skipping rate limit handling.")
        return False

    current_time = int(time.time())

    print(f"DEBUG: API Rate Limit: {rate_limit}")
    print(f"DEBUG: API Calls Remaining: {remaining_calls}")
    print(f"DEBUG: Current Time: {current_time}, Rate Limit Resets At: {reset_time}")

    # If we still have API calls remaining, no need to sleep
    if remaining_calls > 0:
        print("DEBUG: Sufficient API calls remaining. No need to sleep.")
        return False

    # If GitHub response contains "API rate limit exceeded", handle it
    try:
        error_message = response.json().get("message", "").lower()
        if "api rate limit exceeded" in error_message:
            print(f"DEBUG: Detected API rate limit exceeded: {error_message}")
            sleep_time = (reset_time - current_time) if reset_time else 60  # Default sleep 60s if no reset time
            if sleep_time > 0:
                print(f"Rate limit reached. Sleeping for {sleep_time} seconds...")
                time.sleep(sleep_time)
                return True  # Indicates rate limit was handled
    except json.JSONDecodeError:
        print("DEBUG: Failed to decode JSON response for rate limit check.")

    print("DEBUG: No valid reset time found. Not sleeping.")
    return False

# Extract owner and repo_name from the repo_git URL
def extract_owner_repo(repo_git):
    try:
        parsed_url = urlparse(repo_git)
        path_parts = parsed_url.path.strip("/").split("/")
        if len(path_parts) >= 2:
            owner = path_parts[0]
            repo_name = path_parts[1]
            return owner, repo_name
        else:
            print(f"Error: URL {repo_git} does not contain enough parts.")
            return None, None
    except Exception as e:
        print(f"Error extracting owner and repo_name from {repo_git}: {e}")
        return None, None

# Query GitHub API to retrieve the repository source id using the provided token
def get_github_repo_src_id(repo_git, token):
    owner, repo_name = extract_owner_repo(repo_git)
    if not owner or not repo_name:
        return None

    url = f"https://api.github.com/repos/{owner}/{repo_name}"
    headers = {}
    if token:
        headers["Authorization"] = f"token {token}"
    response = requests.get(url, headers=headers)
    
    # Check for rate limit issues
    if handle_rate_limit(response):
        response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        return data.get('id')
    else:
        print(f"Failed to fetch GitHub data for {repo_git}. Status code: {response.status_code}")
        return None
def generate_duplicate_sql_script(duplicate_log_file="duplicate_repos.txt", output_sql_file="duplicate_update.sql"):
    duplicate_pairs = []
    try:
        with open(duplicate_log_file, "r") as f:
            for line in f:
                # Expect each line to have: repo_src_id, repo_id, duplicate_repo_id
                parts = line.strip().split(",")
                if len(parts) == 3:
                    repo_src_id = parts[0].strip()
                    repo_id = parts[1].strip()
                    duplicate_repo_id = parts[2].strip()
                    duplicate_pairs.append((repo_src_id, repo_id, duplicate_repo_id))
    except Exception as e:
        print(f"Error reading duplicate log file: {e}")
        return

    try:
        with open(output_sql_file, "w") as f:
            for repo_src_id, repo_id, duplicate_repo_id in duplicate_pairs:
                f.write(f"-- Duplicate pair: repo_src_id = {repo_src_id}\n")
                f.write("BEGIN;\n")
                f.write(f"UPDATE issue_message_ref SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_review_message_ref SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_message_ref SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE repo_info SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE issue_assignees SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE releases SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_reviews SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_files SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_commits SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_requests SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE repo_badging SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE issues SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE repo_deps_libyear SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE repo_deps_scorecard SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE repo_dependencies SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE commits SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE repo_labor SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE message SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write("--\n")
                f.write(f"delete from augur_operations.user_repos where repo_id = {repo_id};\n")
                f.write(f"delete from augur_operations.collection_status where repo_id = {repo_id};\n")
                f.write(f"delete from commit_messages where repo_id = {repo_id};\n")
                f.write(f"UPDATE issue_events SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE issue_labels SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_labels SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_events SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_meta SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_reviewers SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"UPDATE pull_request_assignees SET repo_id = {duplicate_repo_id} WHERE repo_id = {repo_id};\n")
                f.write(f"delete from repo where repo_id = {repo_id};\n")
                f.write("COMMIT;\n\n")
        print(f"SQL script generated successfully and saved to {output_sql_file}")
    except Exception as e:
        print(f"Error writing SQL script: {e}")
        
def generate_duplicate_sql_script_with_error_check(duplicate_log_file="duplicate_repos.txt", output_sql_file="duplicate_update_error_checking.sql"):
    duplicate_pairs = []
    try:
        with open(duplicate_log_file, "r") as f:
            for line in f:
                # Expect each line to have: repo_src_id, repo_id, duplicate_repo_id
                parts = line.strip().split(",")
                if len(parts) == 3:
                    repo_src_id = parts[0].strip()
                    repo_id = parts[1].strip()
                    duplicate_repo_id = parts[2].strip()
                    duplicate_pairs.append((repo_src_id, repo_id, duplicate_repo_id))
    except Exception as e:
        print(f"Error reading duplicate log file: {e}")
        return

    # List of statements to execute for each duplicate pair.
    stmts = [
        ("UPDATE issue_message_ref SET repo_id = {dup} WHERE repo_id = {rid};", "issue_message_ref"),
        ("UPDATE pull_request_review_message_ref SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_review_message_ref"),
        ("UPDATE pull_request_message_ref SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_message_ref"),
        ("UPDATE repo_info SET repo_id = {dup} WHERE repo_id = {rid};", "repo_info"),
        ("UPDATE issue_assignees SET repo_id = {dup} WHERE repo_id = {rid};", "issue_assignees"),
        ("UPDATE releases SET repo_id = {dup} WHERE repo_id = {rid};", "releases"),
        ("UPDATE pull_request_reviews SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_reviews"),
        ("UPDATE pull_request_files SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_files"),
        ("UPDATE pull_request_commits SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_commits"),
        ("UPDATE pull_requests SET repo_id = {dup} WHERE repo_id = {rid};", "pull_requests"),
        ("UPDATE repo_badging SET repo_id = {dup} WHERE repo_id = {rid};", "repo_badging"),
        ("UPDATE issues SET repo_id = {dup} WHERE repo_id = {rid};", "issues"),
        ("UPDATE repo_deps_libyear SET repo_id = {dup} WHERE repo_id = {rid};", "repo_deps_libyear"),
        ("UPDATE repo_deps_scorecard SET repo_id = {dup} WHERE repo_id = {rid};", "repo_deps_scorecard"),
        ("UPDATE repo_dependencies SET repo_id = {dup} WHERE repo_id = {rid};", "repo_dependencies"),
        ("UPDATE commits SET repo_id = {dup} WHERE repo_id = {rid};", "commits"),
        ("UPDATE repo_labor SET repo_id = {dup} WHERE repo_id = {rid};", "repo_labor"),
        ("UPDATE message SET repo_id = {dup} WHERE repo_id = {rid};", "message"),
        ("delete from augur_operations.user_repos where repo_id = {rid};", "augur_operations.user_repos"),
        ("delete from augur_operations.collection_status where repo_id = {rid};", "augur_operations.collection_status"),
        ("delete from commit_messages where repo_id = {rid};", "commit_messages"),
        ("UPDATE issue_events SET repo_id = {dup} WHERE repo_id = {rid};", "issue_events"),
        ("UPDATE issue_labels SET repo_id = {dup} WHERE repo_id = {rid};", "issue_labels"),
        ("UPDATE pull_request_labels SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_labels"),
        ("UPDATE pull_request_events SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_events"),
        ("UPDATE pull_request_meta SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_meta"),
        ("UPDATE pull_request_reviewers SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_reviewers"),
        ("UPDATE pull_request_assignees SET repo_id = {dup} WHERE repo_id = {rid};", "pull_request_assignees"),
        ("delete from repo where repo_id = {rid};", "repo")
    ]

    def wrap_statement(stmt, table_label, rid):
        # Wrap the given statement in a DO block that catches unique_violation.
        return (
            "DO $$\n"
            "BEGIN\n"
            f"    {stmt}\n"
            "EXCEPTION WHEN unique_violation THEN\n"
            f"    RAISE NOTICE 'Ignoring duplicate error in {table_label} for repo_id {rid}';\n"
            "END $$;\n"
        )

    try:
        with open(output_sql_file, "w") as f:
            for repo_src_id, repo_id, duplicate_repo_id in duplicate_pairs:
                f.write(f"-- Duplicate pair: repo_src_id = {repo_src_id}\n")
                f.write("BEGIN;\n")
                for stmt_tpl, table_label in stmts:
                    stmt = stmt_tpl.format(dup=duplicate_repo_id, rid=repo_id)
                    safe_stmt = wrap_statement(stmt, table_label, repo_id)
                    f.write(safe_stmt)
                f.write("COMMIT;\n\n")
        print(f"SQL script generated successfully and saved to {output_sql_file}")
    except Exception as e:
        print(f"Error writing SQL script: {e}")
        
def main():
    github_token = read_github_token()
    if not github_token:
        print("No GitHub token available. Exiting.")
        return

    db_config = read_db_config()
    if not db_config:
        print("No database configuration available. Exiting.")
        return

    conn = connect_to_db(db_config)
    if not conn:
        print("Database connection failed. Exiting.")
        return

    cursor = conn.cursor()

    # Updated query with schema and new field (repo_git)
    select_query = "SELECT repo_id, repo_git FROM augur_data.repo WHERE repo_src_id IS NULL;"
    try:
        cursor.execute(select_query)
        rows = cursor.fetchall()
    except Exception as e:
        print(f"Error running select query: {e}")
        conn.close()
        return

    DUPLICATE_LOG_FILE = "duplicate_repos.txt"
    with open(DUPLICATE_LOG_FILE, "a") as log_file:
        for row in rows:
            repo_id, repo_git = row
            print(f"Processing repo_id: {repo_id}, {repo_git}")

            repo_src_id = get_github_repo_src_id(repo_git, github_token)
            if not repo_src_id:
                print(f"Skipping repo_id {repo_id} due to API error.")
                continue

            update_query = "UPDATE augur_data.repo SET repo_src_id = %s WHERE repo_id = %s;"
            try:
                cursor.execute(update_query, (repo_src_id, repo_id))
                conn.commit()
                print(f"Updated repo_id {repo_id} with repo_src_id {repo_src_id}.")
            except Exception as e:
                conn.rollback()
                error_message = str(e)
                # Check for duplicate error message
                if "value already exists" in error_message or "duplicate key" in error_message.lower():
                    print(f"Duplicate detected for repo_src_id {repo_src_id} on repo_id {repo_id}.")
                    select_duplicate_query = "SELECT repo_id FROM augur_data.repo WHERE repo_src_id = %s;"
                    try:
                        cursor.execute(select_duplicate_query, (repo_src_id,))
                        duplicate_row = cursor.fetchone()
                        if duplicate_row:
                            duplicate_repo_id = duplicate_row[0]
                            log_line = f"{repo_src_id}, {repo_id}, {duplicate_repo_id}\n"
                            log_file.write(log_line)
                            print(f"Logged duplicate: {log_line.strip()}")
                        else:
                            print(f"No existing row found for repo_src_id {repo_src_id}.")
                    except Exception as dup_e:
                        print(f"Error checking duplicate for repo_src_id {repo_src_id}: {dup_e}")
                else:
                    print(f"Unexpected error updating repo_id {repo_id}: {e}")

    cursor.close()
    conn.close()

    # Final step: Generate the SQL script from the duplicate log file.
    generate_duplicate_sql_script()
    generate_duplicate_sql_script_with_error_check()

if __name__ == "__main__":
    main()