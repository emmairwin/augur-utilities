# Repo Linter Notes
**This set of scripts allows you to run the repo linter described below for many repositories in one script. The default behavior of the linter is to generate one file for each repository. This is more cumbersome to work with when analyzing a portfolio of repositories**
1. This uses the TODO Group's RepoLinter Here: https://todogroup.github.io/repolinter/  (Note: Uses NodeJS and includes all the usual NodeJS configuration challenges)
2. The `todo-linter.py` file runs to generate a JSON output for a set of Augur repos in an existing Augur Database. It reads metadata about the repository's physical location on disk, and then genrates the linting output as one large JSON file. There is an example output from CNCF Projects in the [output](./output/) subfolder.
3. The `insert_data.py` file creates and populates table in the `analysis` schema of an Augur database (this is a new schema). For this file, you need to edit it so that the output from `todo-linter.py` is the input file referenced here. 
4. The `data_analysis.sql` file is how the results of analysis can be generated. [In the example](./output/license-readme.xlsx), we look only for the presence of a license file and a README.md file. If you remove the `where` clause on this query there will be many other linted indicators. 

