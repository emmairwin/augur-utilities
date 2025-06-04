#!/usr/bin/env python3

import os
import subprocess
import shutil
import csv
import json
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
import argparse
from datetime import datetime

BASE_DIR = Path("/mnt/external/ai-repos/mnt/repos/repos/hostedaugur/hosted")
MAX_WORKERS = 8  # Adjust based on system capabilities

results = []

def is_git_repo_valid(repo_path):
    try:
        subprocess.run(
            ["git", "-C", str(repo_path), "rev-parse", "--is-inside-work-tree"],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
        return True
    except subprocess.CalledProcessError:
        return False


def get_remote_url(repo_path):
    try:
        result = subprocess.run(
            ["git", "-C", str(repo_path), "config", "--get", "remote.origin.url"],
            check=True,
            capture_output=True,
            text=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        return None


def repair_repo(subdir_path, dry_run=False):
    entry = {
        "path": str(subdir_path),
        "status": "",
        "remote_url": "",
    }

    entries = list(subdir_path.iterdir())
    if len(entries) != 1 or not entries[0].is_dir():
        entry["status"] = "invalid_layout"
        return entry

    repo_path = entries[0]
    entry["path"] = str(repo_path)

    if is_git_repo_valid(repo_path):
        entry["status"] = "ok"
        return entry

    remote_url = get_remote_url(repo_path)
    entry["remote_url"] = remote_url if remote_url else ""

    if not remote_url:
        entry["status"] = "missing_origin"
        return entry

    if dry_run:
        entry["status"] = "would_reclone"
        return entry

    # Re-clone logic
    temp_path = repo_path.with_name(repo_path.name + "_reclone_tmp")
    try:
        subprocess.run(
            ["git", "clone", remote_url, str(temp_path)],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
        shutil.rmtree(repo_path)
        temp_path.rename(repo_path)
        entry["status"] = "recloned"
    except subprocess.CalledProcessError:
        entry["status"] = "clone_failed"
    except Exception as e:
        entry["status"] = f"error: {e}"

    return entry


def write_summary(results, out_prefix="repo_check"):
    ts = datetime.now().strftime("%Y%m%d_%H%M%S")
    csv_file = f"{out_prefix}_{ts}.csv"
    json_file = f"{out_prefix}_{ts}.json"

    # CSV
    with open(csv_file, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["path", "remote_url", "status"])
        writer.writeheader()
        writer.writerows(results)

    # JSON
    with open(json_file, "w") as f:
        json.dump(results, f, indent=2)

    print(f"\n✅ Summary written to:\n  {csv_file}\n  {json_file}")


def main():
    parser = argparse.ArgumentParser(description="Verify and optionally re-clone corrupt Git repos")
    parser.add_argument('--dry-run', action='store_true', help="Only print actions without making changes")
    args = parser.parse_args()

    subdirs = [p for p in BASE_DIR.iterdir() if p.is_dir()]
    print(f"Scanning {len(subdirs)} repo directories...\n")

    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        futures = {
            executor.submit(repair_repo, subdir, args.dry_run): subdir
            for subdir in subdirs
        }
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(f"{result['status'].upper():<15} {result['path']}")

    write_summary(results)


if __name__ == "__main__":
    main()
