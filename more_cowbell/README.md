# More Cowbell: The Utility
**origins**: This utility is effectively a reaper for repositories that are not being collected. It is "The Reaper". "Don't Fear the Reaper" is a Blue Oyster Cult Song. In a famous episode of Saturday Night Live Christopher Walken played the musical producer of that song, and Will Ferrel played the cowbell. Walken made famous assertions like, "I got a fever. And the only cure is more cowbell". So, that's why the name. 

**CURRENT STATUS**: Repo deletion is turning out to be problematic from a performance perspective on very large instances. Well, at least the largest of Augur instances. Working now on a method that is more robust, and will update rows to the correct repo_id instead of deleting rows. This is _in progress_. 

## This utility: 
1. Reads a markdown file like the examples provided and checks the GitHub API to determine if 
    * The repository still exists
    * If the repository, still existing, has moved
    * What the new URL for the repository "is" and 
    * The GitHub identifier for that repository, which could be especially useful for evolving this script into checking an Augur instance for duplicate repositories. 
2. Outputs a file with a structure of "url checked", "still exists", moved, "new repo URL or repo URL", and GitHub identifier. 
3. Generates an SQL script called `generated_sql_script.sql`. This script will delete any duplicate repositories that emerged in Augur instances from before May, 2024. For these older instances there is a possibility for duplicate repositories to be introduced into the system when a platform organization is added if that organization identifies repo url's not in the database already *and* (the important part) some of those repositories that appeared "new" were actually in existance with an older, redirected URL. Augur has auto updated URLs for over four years, but the timing of when things run did not account for the possibility of that issue. The fix introduced in 2024 ensures that the platform numeric identifier for a repository, which remains unchanged when the repository is moved or renamed, is also checked prior to insertion. 

## Configuration
1. This script was tested with Python 3.13.2 running on OSX, and installed using brew. 
2. The `githubapi.json.example` file should be copied to a local file `githubapi.json`, and a GitHub API key should be added in the specified location
3. Create a python virtual environment `python3 -m venv .venv`, for example. 
4. `pip install -r requirements.txt` will install the libraries this utility leverages from the Python ecosystem. 