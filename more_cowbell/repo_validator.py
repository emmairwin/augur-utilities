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

# Check repository URLs and Repo ID in the database
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

        # Check if the Repo ID exists in the database
        cur.execute("SELECT repo_git FROM augur_data.repo WHERE repo_src_id = %s", (repo_id,))
        row = cur.fetchone()
        if row:
            results["repo_id_exists"] = True
            results["conflicting_url"] = row[0]  # The URL that contains the conflicting Repo ID

        # If both old and new URLs exist, check for repo_git with NULL repo_src_id
        if results["old_url_exists"] and results["new_url_exists"]:
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

# Read repository URLs from a markdown file
def read_repos_from_markdown(md_file):
    try:
        with open(md_file, "r", encoding="utf-8") as f:
            lines = f.read().splitlines()
        urls = [line.strip() for line in lines if line.strip()]
        print(f"Read {len(urls)} URLs from {md_file}")  # Debug print
        return urls
    except Exception as e:
        print(f"Error reading file: {e}")
        return []

def check_repository_status(url):
    headers = {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": f"token {GITHUB_TOKEN}"
    }
    
    # Extract repository path from URL
    repo_path = "/".join(url.split("https://github.com/")[-1].split("/"))
    api_url = f"https://api.github.com/repos/{repo_path}"

    print(f"Checking: {url}")  # Debug print

    for attempt in range(3):  # Retry up to 3 times in case of rate-limiting
        try:
            response = requests.get(api_url, headers=headers, allow_redirects=False)
            print(f"Response Code for {url}: {response.status_code}")  # Debug print

            if response.status_code == 200:
                json_data = response.json()
                correct_html_url = json_data.get("html_url", url)
                repo_id = json_data.get("id", None)  # Extract Repository ID
                return url, True, False, correct_html_url, repo_id  # Repo exists, not moved

            elif response.status_code in [301, 302]:  # Redirection
                new_repo_response = requests.get(api_url, headers=headers, allow_redirects=True)
                if new_repo_response.status_code == 200:
                    new_json_data = new_repo_response.json()
                    new_html_url = new_json_data.get("html_url", None)  # Extract correct HTML URL
                    repo_id = new_json_data.get("id", None)  # Extract Repository ID
                    return url, True, True, new_html_url if new_html_url else "Unknown", repo_id

            elif response.status_code == 404:
                return url, False, False, None, None  # Repo doesn't exist

            elif response.status_code == 429:  # Too Many Requests
                print(f"Rate limited. Waiting 60 seconds before retrying... (Attempt {attempt+1}/3)")
                time.sleep(60)  # Wait before retrying
            else:
                break  # Other errors, no need to retry

        except requests.RequestException as e:
            print(f"Request failed for {url}: {e}")
            break

    return url, False, False, None, None  # Default case

# Load repositories from markdown file
md_file = "repos.md"  # Change this to your markdown file path
repo_urls = read_repos_from_markdown(md_file)

if not repo_urls:
    print("No URLs found. Exiting...")
    exit()

# Check all repositories
results = []
duplicates = []

for url in repo_urls:
    old_url, still_there, moved, new_url, repo_id = check_repository_status(url)

    db_results = check_repository_in_db(conn, old_url, new_url, repo_id)

    # Store results
    results.append((old_url, still_there, moved, new_url, repo_id))

    # Detect duplicate repos
    if db_results["repo_id_exists"] and db_results["old_url_exists"] and db_results["new_url_exists"]:
        duplicates.append((old_url, new_url, repo_id, db_results["conflicting_url"], db_results["repo_git_with_null_src_id"]))

# Save duplicate repos to CSV if any found
if duplicates:
    duplicate_file = "duplicate_repos.csv"
    with open(duplicate_file, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["Old URL", "New URL", "Repo ID", "Conflicting URL", "Repo with NULL repo_src_id"])
        writer.writerows(duplicates)
    
    print(f"Duplicate repository report saved to {duplicate_file}")

# Close the database connection
conn.close()