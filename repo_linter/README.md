# Repo Linter Notes
1. This uses the TODO Group's RepoLinter Here: https://todogroup.github.io/repolinter/  (Note: Uses NodeJS and includes all the usual NodeJS configuration challenges)
2. The `todo-linter.py` file runs to generate a JSON output for a set of Augur repos in an existing Augur Database. It reads that metadata and then genrates the linting output as one large JSON file. 
3. The `insert_data.py` file creates and populates table in the `analysis` schema of an Augur database (this is a new schema). 

