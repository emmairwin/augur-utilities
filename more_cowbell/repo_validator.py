import requests
import csv
import time
import json
import pandas as pd

# Read API key from githubapi.json
def read_github_token(file_path="githubapi.json"):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
            return data.get("GITHUB_TOKEN", None)
    except Exception as e:
        print(f"Error reading GitHub API key from {file_path}: {e}")
        return None

# Get GitHub token
GITHUB_TOKEN = read_github_token()

if not GITHUB_TOKEN:
    print("GitHub API key is missing. Please add it to githubapi.json.")
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
                return url, True, False, correct_html_url  # Repo exists, not moved

            elif response.status_code in [301, 302]:  # Redirection
                new_repo_response = requests.get(api_url, headers=headers, allow_redirects=True)
                if new_repo_response.status_code == 200:
                    new_json_data = new_repo_response.json()
                    new_html_url = new_json_data.get("html_url", None)  # Extract correct HTML URL
                    return url, True, True, new_html_url if new_html_url else "Unknown"

            elif response.status_code == 404:
                return url, False, False, None  # Repo doesn't exist

            elif response.status_code == 429:  # Too Many Requests
                print(f"Rate limited. Waiting 60 seconds before retrying... (Attempt {attempt+1}/3)")
                time.sleep(60)  # Wait before retrying
            else:
                break  # Other errors, no need to retry

        except requests.RequestException as e:
            print(f"Request failed for {url}: {e}")
            break

    return url, False, False, None  # Default case

# Load repositories from markdown file
md_file = "repos-small.md"  # Change this to your markdown file path
repo_urls = read_repos_from_markdown(md_file)

if not repo_urls:
    print("No URLs found. Exiting...")
    exit()

# Check all repositories
results = [check_repository_status(url) for url in repo_urls]

# Debug print: check if results are generated
print(f"Results collected: {len(results)} entries")

# Save to CSV
output_file = "repo_status.csv"
with open(output_file, "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["URL Searched", "Still There", "Moved", "New URL"])
    writer.writerows(results)

print(f"Results saved to {output_file}")  # Debug print

# Display output using Pandas
df = pd.DataFrame(results, columns=["URL Searched", "Still There", "Moved", "New URL"])
print(df)  # Print results to the screen

# Optional: Save the table to a file
df.to_csv("repo_status2.csv", index=False)