--SPDX-License-Identifier: MIT

create table analysis.network_cncf_dependencies as 
SELECT cntrb_id,repo_id, ACTION, 
date_part('year', created_at) as action_year, 
--date_part('month', created_at) as action_month, 
extract(quarter from created_at) as action_quarter, 
COUNT(*) AS counter 
FROM explorer_contributor_actions 
WHERE cntrb_id IN (
SELECT DISTINCT cntrb_id FROM augur_data.explorer_contributor_actions 
WHERE repo_id IN (
SELECT repo_id FROM augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id=241))
	group by cntrb_id, repo_id, action, action_year, action_quarter
	order by cntrb_id, repo_id, action_year desc, action_quarter desc;-- sandbox 3,207,941



create table analysis.cncf_dependencies_repos as 
SELECT repo.* FROM augur_operations.user_groups,augur_operations.user_repos, augur_data.repo 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	and augur_operations.user_repos.repo_id = repo.repo_id
	AND user_groups.group_id=241
	order by repo_git;

	
