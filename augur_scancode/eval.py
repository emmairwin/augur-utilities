import os
import subprocess
import json
import sys

def load_config(config_file="config.json"):
    with open(config_file, "r") as f:
        return json.load(f)

def run_scancode_on_subdirs(base_dir, output_dir, threads):
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
    config = load_config("config.json")
    run_scancode_on_subdirs(
        base_dir=config["BASE_DIR"],
        output_dir=config["OUTPUT_DIR"],
        threads=config["NUM_THREADS"]
    )