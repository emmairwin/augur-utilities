# Augur SysAdmin

1. [Using nginx to route local incoming traffic](./nginx-port-forwarding.md) 🚦
2. [Reset your RABBITMQ configuration](./osx-rabbitmq-reset.sh) 🐇
3. [Large Augur instance reference postgresql.conf](./postgresql.conf) 🤓
4. [Check the Clones in an Augur Instance](./check_clones.py) This makes sure that the clones are all valid and not corrupted and fixes any that go off the beaten track. 

## [Check Clones](./check_clones.py)

1. Create a python virtual environment if you don't already have one setup `python3 -m venv .venv` followed by `source .venv/bin/activate`
2. Install required libraries: `pip install -r requirements.txt`
3. Run the program: `python check_clones.py --dry-run`

This program will generate output like this, with each file representing a list of repositories in each state: 
```
repo_check_20250604_1523.csv
repo_check_20250604_1523.json
repo_check_fsck_failed_20250604_1523.csv
repo_check_fetch_failed_20250604_1523.csv
repo_check_missing_origin_20250604_1523.csv
```

