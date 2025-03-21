import requests
import csv
import time
import json
import pandas as pd
import psycopg2  # PostgreSQL Database Driver

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

    # Extract rate limit headers
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

    # If we still have API calls remaining, we should NOT sleep
    if remaining_calls > 0:
        print("DEBUG: Sufficient API calls remaining. No need to sleep.")
        return False

    # If GitHub response contains "API rate limit exceeded", handle it
    try:
        error_message = response.json().get("message", "").lower()
        if "api rate limit exceeded" in error_message:
            print(f"DEBUG: Detected API rate limit exceeded: {error_message}")

            # Compute sleep time
            sleep_time = (reset_time - current_time) if reset_time else 60  # Default sleep 60s if no reset time
            if sleep_time > 0:
                print(f"Rate limit reached. Sleeping for {sleep_time} seconds...")
                time.sleep(sleep_time)
                return True  # Indicates rate limit was handled

    except json.JSONDecodeError:
        print("DEBUG: Failed to decode JSON response for rate limit check.")

    print("DEBUG: No valid reset time found. Not sleeping.")
    return False  # No rate limit issue

# Function to check repository status via GitHub API
def check_repository_status(url):
    headers = {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": f"token {GITHUB_TOKEN}",
        "User-Agent": "CHAOSS-GitHubRepoChecker"  # Helps prevent bot blocking
    }
    
    repo_path = "/".join(url.split("https://github.com/")[-1].split("/"))
    api_url = f"https://api.github.com/repos/{repo_path}"

    print(f"Checking: {url}")

    for attempt in range(5):  # Retry up to 5 times if rate limited
        response = requests.get(api_url, headers=headers, allow_redirects=False)
        
        if response.status_code == 200:
            json_data = response.json()
            correct_html_url = json_data.get("html_url", url)
            repo_id = json_data.get("id", None)
            print(f'code: {response.status_code}')
            return url, True, False, correct_html_url, repo_id

        elif response.status_code in [301, 302]:  # Redirection
            new_repo_response = requests.get(api_url, headers=headers, allow_redirects=True)
            if new_repo_response.status_code == 200:
                new_json_data = new_repo_response.json()
                new_html_url = new_json_data.get("html_url", None)
                repo_id = new_json_data.get("id", None)
                print(f'code: {response.status_code}')
                return url, True, True, new_html_url if new_html_url else "Unknown", repo_id

        elif response.status_code == 403 and handle_rate_limit(response):
            try:
                error_message = response.json().get("message", "").lower()
                print(f"DEBUG: 403 Response - Error Message: {error_message}")

                # Check if the message contains TOS violation indicators
                if "repository unavailable due to a takedown" in error_message or "repository is disabled" in error_message:
                    print(f"Repository {url} has been removed due to GitHub TOS violation.")
                    return url, False, False, "TOS Violation", None  # Special indicator for TOS removals

            except json.JSONDecodeError:
                print(f"DEBUG: Failed to decode JSON error message for {url}")
                print(f'code: {response.status_code}')

            return url, False, False, None, None  # Generic 403 case

        elif response.status_code == 404:
            print(f'code: {response.status_code}')
            return url, False, False, None, None  # Repository doesn't exist

        elif response.status_code == 429 or handle_rate_limit(response):  # Too Many Requests or Rate Limit
            print(f"Rate limited. Retrying... (Attempt {attempt+1}/5)")
            print(f'code: {response.status_code}')
            continue  # Retry after sleeping

        else:
            print(f"Unexpected error for {url}: {response.status_code}")
            break  # Don't retry other errors

    return url, False, False, None, None  # Default case after retries

# Get GitHub token
GITHUB_TOKEN = read_github_token()
if not GITHUB_TOKEN:
    print("GitHub API key is missing. Please add it to githubapi.json.")
    exit(1)

# Read DB config
DB_CONFIG = read_db_config()
if not DB_CONFIG:
    print("Database configuration is missing. Please add it to db_config.json.")
    exit(1)

# Connect to the database
conn = connect_to_db(DB_CONFIG)
if not conn:
    print("Could not connect to the database. Exiting...")
    exit(1)

# Load repository URLs from markdown file
def read_repos_from_markdown(md_file):
    try:
        with open(md_file, "r", encoding="utf-8") as f:
            lines = f.read().splitlines()
        urls = [line.strip() for line in lines if line.strip()]
        print(f"Read {len(urls)} URLs from {md_file}")
        return urls
    except Exception as e:
        print(f"Error reading file: {e}")
        return []

# Process repositories
md_file = "repos.md"
repo_urls = read_repos_from_markdown(md_file)

if not repo_urls:
    print("No URLs found. Exiting...")
    exit()

# Check repository in DB
def check_repository_in_db(conn, old_url, new_url, repo_id):
    with conn.cursor() as cur:
        results = {
            "old_url_exists": False,
            "new_url_exists": False,
            "repo_id_exists": False,
            "conflicting_url": None,
            "repo_git_with_null_src_id": None
        }

        # Check if the old URL exists
        cur.execute("SELECT COUNT(*) FROM augur_data.repo WHERE repo_git = %s", (old_url,))
        results["old_url_exists"] = cur.fetchone()[0] > 0

        # Check if the new URL exists (if applicable)
        if new_url:
            cur.execute("SELECT COUNT(*) FROM augur_data.repo WHERE repo_git = %s", (new_url,))
            results["new_url_exists"] = cur.fetchone()[0] > 0

        # Check if the Repo (GitHub Source) ID exists in the database
        cur.execute("SELECT repo_git FROM augur_data.repo WHERE repo_src_id = %s", (repo_id,))
        row = cur.fetchone()
        if row:
            results["repo_id_exists"] = True
            results["conflicting_url"] = row[0]  # The URL that contains the conflicting Repo ID

        # If both old and new URLs exist, check for repo_git with NULL repo_src_id
        if results["old_url_exists"] and results["new_url_exists"]: # I think it will work cleaner if we only grab records where repo_src_id exists 
            cur.execute(
                """
                SELECT repo_id FROM augur_data.repo
                WHERE repo_git IN (%s, %s) AND repo_src_id IS NULL
                """,
                (old_url, new_url)
            )
            null_src_id_row = cur.fetchone()
            if null_src_id_row:
                results["repo_git_with_null_src_id"] = null_src_id_row[0]  # The repo_git with NULL repo_src_id

        return results

# Check all repositories
results = []
duplicates = []
"""
for url in repo_urls:
    old_url, still_there, moved, new_url, repo_id = check_repository_status(url)

    db_results = check_repository_in_db(conn, old_url, new_url, repo_id)

    # Store results
    results.append((old_url, still_there, moved, new_url, repo_id))

    # Detect duplicate repos
    ## TODO: Make sure no duplicate repo ids are included. 
    if db_results["repo_id_exists"] and db_results["old_url_exists"] and db_results["new_url_exists"]:
        duplicates.append((old_url, new_url, repo_id, db_results["conflicting_url"], db_results["repo_git_with_null_src_id"]))
"""

# Loop through the list of repository URLs
for url in repo_urls:
    # Check the repository status: old URL, new URL, and repo ID
    old_url, still_there, moved, new_url, repo_id = check_repository_status(url)

    # Check the repository existence in the database
    db_results = check_repository_in_db(conn, old_url, new_url, repo_id)

    # Detect if repo_id is already in duplicates
    if repo_id in [dup[2] for dup in duplicates]:  # Dup[2] is where the repo_id is stored in the duplicates list
        continue  # Skip this iteration if repo_id is already in duplicates

    # Store results if the repository is not a duplicate
    results.append((old_url, still_there, moved, new_url, repo_id))

    # Detect duplicate repos based on database checks
    if db_results["repo_id_exists"] and db_results["old_url_exists"] and db_results["new_url_exists"]:
        duplicates.append((old_url, new_url, repo_id, db_results["conflicting_url"], db_results["repo_git_with_null_src_id"]))

# Save duplicate repos to CSV if any found
if duplicates:
    duplicate_file = "duplicate_repos.csv"
    with open(duplicate_file, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["Old URL", "New URL", "Repo ID", "URL with repo_src_id", "Augur repo_id with NULL repo_src_id"])
        writer.writerows(duplicates)
    
    print(f"Duplicate repository report saved to {duplicate_file}")

# Save results to CSV
results_file = "results.csv"
with open(results_file, "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["old_url", "still_there", "moved", "new_url", "repo_src_id"])
    writer.writerows(results)

print(f"Results saved to {results_file}")

#build a query
query_file = "deleter.sql"
with open(query_file, "w", newline="") as dr: 
    writer = csv.writer(dr)
    
    # Extract repo_ids from duplicates
    #repos_to_delete = [row[4] for row in duplicates]  # Assuming row[4] contains the repo_id
    repos_to_delete = [row[4] for row in duplicates if row[4] is not None]  
    print(f"repos to delete {repos_to_delete}")

    # Write delete statements to file
    writer.writerows([[f"delete from repo where repo_id = {repo_id};"] for repo_id in repos_to_delete])

def generate_sql_script(repo_ids, output_file="generated_sql_script.sql"):
    # Deduplicate repo_ids
    unique_repo_ids = sorted(set(repo_ids))  

    # Define the SQL template
    sql_statements = []

    # Alter table constraints
    sql_statements.append("""
        ALTER TABLE "augur_data"."pull_request_message_ref" 
        DROP CONSTRAINT "fk_pull_request_message_ref_message_1",
        ADD CONSTRAINT "fk_pull_request_message_ref_message_1" FOREIGN KEY ("msg_id") REFERENCES "augur_data"."message" ("msg_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
    """)

    # Select statements
    for repo_id in unique_repo_ids:
        sql_statements.append(f"SELECT * FROM repo WHERE repo_id = {repo_id};")
        sql_statements.append(f"SELECT * FROM augur_operations.collection_status WHERE repo_id = {repo_id};")

    # Delete statements per repo_id
    for repo_id in unique_repo_ids:
        sql_statements.append(f"DELETE FROM issue_message_ref WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM pull_request_review_message_ref WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM pull_request_message_ref WHERE repo_id = {repo_id};")
        sql_statements.append("COMMIT;")
    
    for repo_id in unique_repo_ids:
        sql_statements.append(f"DELETE FROM repo_info WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM augur_operations.collection_status WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM augur_operations.user_repos WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM issue_assignees WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM releases WHERE repo_id = {repo_id};")

    # Index creation
    sql_statements.append("""
        CREATE INDEX "pr_rev_cntrb" ON "augur_data"."pull_request_reviews" USING btree ("cntrb_id");
        CREATE INDEX "pr_repo_id_idx" ON "augur_data"."pull_request_reviews" USING btree ("repo_id");
    """)

    for repo_id in unique_repo_ids:
        sql_statements.append(f"""
            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = {repo_id}
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'Deleted % rows in this batch for repo {repo_id}. Total deleted so far: %', rows_deleted, total_deleted;
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            """)

    # More delete statements per repo_id
    for repo_id in unique_repo_ids:
        sql_statements.append(f"DELETE FROM pull_request_files WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM pull_request_commits WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM pull_requests WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM repo_badging WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM issues WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM repo_deps_libyear WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM repo_deps_scorecard WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM repo_dependencies WHERE repo_id = {repo_id};")
        sql_statements.append("COMMIT;")

    for repo_id in unique_repo_ids:
        sql_statements.append(f"DELETE FROM commits WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM repo_labor WHERE repo_id = {repo_id};")
        sql_statements.append(f"SELECT * FROM pull_request_message_ref WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM pull_request_message_ref CASCADE WHERE repo_id = {repo_id};")
        sql_statements.append("COMMIT;")

    # Alter table constraints again
    sql_statements.append("""
        ALTER TABLE "augur_data"."pull_request_review_message_ref" 
        DROP CONSTRAINT "fk_pull_request_review_message_ref_message_1",
        ADD CONSTRAINT "fk_pull_request_review_message_ref_message_1" FOREIGN KEY ("msg_id") REFERENCES "augur_data"."message" ("msg_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
    """)

    for repo_id in unique_repo_ids:
        sql_statements.append(f"DELETE FROM message CASCADE WHERE repo_id = {repo_id};")
        sql_statements.append("COMMIT;")
    
    for repo_id in unique_repo_ids:
        sql_statements.append(f"DELETE FROM pull_request_review_message_ref CASCADE WHERE repo_id = {repo_id};")
        sql_statements.append(f"DELETE FROM repo CASCADE WHERE repo_id = {repo_id};")
        sql_statements.append("COMMIT;")

    # Write to the output file
    with open(output_file, "w") as f:
        f.write("\n".join(sql_statements))

    print(f"SQL script generated and saved as {output_file}.")
    """
    repo_id_str = ",".join(map(str, repo_ids))
    sql_script = sql_template.format(repo_ids=repo_id_str)
    
    with open(output_file, "w") as file:
        file.write(sql_script)
    
    print(f"SQL script successfully written to {output_file}")
"""
# Example usage
#repo_ids = [235219,196224,195980,196007,195987,196185,196178,196186,196099,
#            196110,196111,196165,196101,196100,196102,196103,196104,196105,
#            196107,196108,196109,196145,196147,194697]

generate_sql_script(repos_to_delete)



# Close the database connection
conn.close()