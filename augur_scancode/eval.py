import os
import subprocess
import sys

# Change this to your base directory containing subdirectories to scan
BASE_DIR = "repositories"
OUTPUT_DIR = "scan_results"  # you can change or set to "." if you want current dir

# Optional: number of scan threads
NUM_THREADS = 2

def run_scancode_on_subdirs(base_dir, output_dir, threads=2):
    os.makedirs(output_dir, exist_ok=True)

    for entry in os.listdir(base_dir):
        sub_path = os.path.join(base_dir, entry)

        if os.path.isdir(sub_path):
            output_file = os.path.join(output_dir, f"{entry}.json")

            print(f"🔍 Scanning {sub_path} → {output_file}")
            try:
                subprocess.run([
                    "scancode", "-cli",
                    "-n", str(threads),
                    "--json-pp", output_file,
                    sub_path
                ], check=True)
            except subprocess.CalledProcessError as e:
                print(f"❌ Error scanning {entry}: {e}")

if __name__ == "__main__":
    run_scancode_on_subdirs(BASE_DIR, OUTPUT_DIR, NUM_THREADS)