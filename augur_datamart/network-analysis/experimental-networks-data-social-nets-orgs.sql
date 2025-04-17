--SPDX-License-Identifier: MIT

/**
Count Rows
**/
select count(*) from analysis.network_sandbox_orgs; --3,207,941
select count(*) from analysis.network_incubating_orgs; --3,650,436
select count(*) from analysis.network_graduated_orgs; --5,233,952


/**
Drop tables if they exist 
**/ 
drop table if exists analysis.network_sandbox_orgs;  
drop table if exists analysis.network_incubating_orgs; 
drop table if exists analysis.network_graduated_orgs; 
drop table if exists analysis.repo_all_orgs; 
drop table if exists analysis.cncf_repos_orgs;  
drop table if exists analysis.network_beyond_augur_orgs; 



/**
All the actions for all the repos we have in the instance for anyone who has been 
a contributor to a CNCF project  
grouped by QUARTER and year 
**/ 

create table analysis.network_sandbox_orgs as 
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
	AND user_groups.group_id=193))
	group by cntrb_id, repo_id, action, action_year, action_quarter
	order by cntrb_id, repo_id, action_year desc, action_quarter desc;-- sandbox 3,207,941


create table analysis.network_incubating_orgs as 
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
	AND user_groups.group_id=194))
	group by cntrb_id, repo_id, action, action_year, action_quarter
	order by cntrb_id, repo_id, action_year desc, action_quarter desc;-- incubating

create table analysis.network_graduated_orgs as 
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
	AND user_groups.group_id=195))
	group by cntrb_id, repo_id, action, action_year, action_quarter
	order by cntrb_id, repo_id, action_year desc, action_quarter desc;-- graduated
	
	

create table analysis.repo_all_orgs as 
select repo_name, repo_git, repo_id from 
repo where repo_id in 
(
select distinct repo_id from 
augur_data.explorer_contributor_actions 
where cntrb_id in (

SELECT DISTINCT
cntrb_id 
FROM
	augur_data.explorer_contributor_actions 
WHERE
	repo_id IN (
	SELECT
		repo_id 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos 
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (193,194,195)
	))); -- cncf 


create table analysis.cncf_repos_orgs as 
SELECT distinct 
		repo_id, 'sandbox' as category 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (193); --,194,195)
		
insert into analysis.cncf_repos_orgs 
SELECT distinct 
		repo_id, 'incubating' as category 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (194); --,194,195)
		

insert into analysis.cncf_repos_orgs
SELECT distinct 
		repo_id, 'graduated' as category 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (195); --,194,195)
		
	

create table analysis.network_beyond_augur_orgs as 
select distinct cntrb_id, repo_git, repo_name, cntrb_category as ACTION, 
date_part('year', created_at) as action_year, 
extract(quarter from created_at) as action_quarter, 
COUNT(*) AS counter 
 from contributor_repo where cntrb_id 
in (
SELECT DISTINCT
cntrb_id 
FROM
	augur_data.explorer_contributor_actions 
WHERE
	repo_id IN (
	SELECT
		repo_id 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos 
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (193,194,195)
	)-- cncf 
	) group by cntrb_id, repo_git, repo_name, cntrb_category, action_year, action_quarter;  --63717 64,164
	

/**
Count Rows
**/
select count(*) from analysis.network_sandbox_orgs; --3,207,941. 3,215,197
select count(*) from analysis.network_incubating_orgs; --3,650,436. 3,659,969
select count(*) from analysis.network_graduated_orgs; --5,233,952 5,222,427


CREATE UNIQUE INDEX CONCURRENTLY "repo_key2" ON "analysis"."cncf_repos_orgs" (
  "repo_id"
);

ALTER TABLE "analysis"."network_graduated_orgs" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_id" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_id", "action", "action_year", "action_quarter");


ALTER TABLE "analysis"."network_sandbox_orgs" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_id" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_id", "action", "action_year", "action_quarter");
	

ALTER TABLE "analysis"."network_incubating_orgs" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_id" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_id", "action", "action_year", "action_quarter");
	
	
CREATE UNIQUE INDEX CONCURRENTLY "repo_id_all1" ON "analysis"."repo_all_orgs" (
  "repo_id"
);


ALTER TABLE "analysis"."network_beyond_augur_orgs" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_git" SET NOT NULL,
  ALTER COLUMN "repo_name" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_git", "repo_name", "action", "action_year", "action_quarter");

CREATE INDEX "nba_cntrbid_orgs" ON "analysis"."network_beyond_augur_orgs" USING btree (
  "cntrb_id"
);

CREATE INDEX "nba-repo-git_orgs" ON "analysis"."network_beyond_augur_orgs" USING hash (
  "repo_git"
);