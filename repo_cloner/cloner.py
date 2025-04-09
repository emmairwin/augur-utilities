import os
import subprocess
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path

REPO_LIST_FILE = "repos.txt"
CLONE_DIR = "cloned_repos"

def normalize_url(url):
    url = url.strip()
    if not url:
        return None
    if not url.startswith("https://") and not url.startswith("git@"):
        # Assume github.com and prepend if missing
        if url.startswith("github.com"):
            url = "https://" + url
        else:
            url = "https://github.com/" + url
    return url

def clone_repo(repo_url):
    repo_url = normalize_url(repo_url)
    if not repo_url:
        return "[SKIPPED] Empty or invalid URL."

    repo_name = repo_url.rstrip("/").split("/")[-1].replace(".git", "")
    target_path = os.path.join(CLONE_DIR, repo_name)

    if os.path.exists(target_path):
        return f"[SKIPPED] {repo_name} already exists."

    try:
        subprocess.run(["git", "clone", repo_url, target_path],
                       check=True,
                       stdout=subprocess.PIPE,
                       stderr=subprocess.PIPE)
        return f"[CLONED] {repo_url}"
    except subprocess.CalledProcessError as e:
        return f"[ERROR] Failed to clone {repo_url}: {e.stderr.decode().strip()}"

def main():
    Path(CLONE_DIR).mkdir(parents=True, exist_ok=True)

    with open(REPO_LIST_FILE, "r") as f:
        raw_urls = [line.strip() for line in f if line.strip()]

    # Normalize and deduplicate
    urls = list({normalize_url(url) for url in raw_urls if normalize_url(url)})

    with ProcessPoolExecutor(max_workers=20) as executor:
        results = executor.map(clone_repo, urls)

    for result in results:
        print(result)

if __name__ == "__main__":
    main()