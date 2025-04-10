/**
Count Rows
**/
select count(*) from analysis.network_sandbox; --3,207,941
select count(*) from analysis.network_incubating; --3,650,436
select count(*) from analysis.network_graduated; --5,233,952


/**
Drop tables if they exist 
**/ 
drop table if exists analysis.network_sandbox;  
drop table if exists analysis.network_incubating; 
drop table if exists analysis.network_graduated; 
drop table if exists analysis.action_types;  
drop table if exists analysis.repo_all; 
drop table if exists analysis.cncf_repos;  



/**
All the actions for all the repos we have in the instance for anyone who has been 
a contributor to a CNCF project  
grouped by QUARTER and year 
**/ 

create table analysis.network_sandbox as 
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
	AND user_groups.group_id=166))
	group by cntrb_id, repo_id, action, action_year, action_quarter
	order by cntrb_id, repo_id, action_year desc, action_quarter desc;-- sandbox 3,207,941


create table analysis.network_incubating as 
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
	AND user_groups.group_id=167))
	group by cntrb_id, repo_id, action, action_year, action_quarter
	order by cntrb_id, repo_id, action_year desc, action_quarter desc;-- incubating

create table analysis.network_graduated as 
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
	AND user_groups.group_id=168))
	group by cntrb_id, repo_id, action, action_year, action_quarter
	order by cntrb_id, repo_id, action_year desc, action_quarter desc;-- graduated
	
	
	
/**

All of the discrete actions in explorer_contributor_actions

commit
issue_closed
issue_comment																
issue_opened
pull_request_closed
pull_request_comment
pull_request_merged
pull_request_open
pull_request_review_APPROVED
pull_request_review_CHANGES_REQUESTED
pull_request_review_COMMENTED
pull_request_review_DISMISSED
pull_request_review_PENDING
**/ 
create table analysis.action_types as 
select distinct action from explorer_contributor_actions; 

create table analysis.repo_all as 
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
		AND user_groups.group_id in (166,167,168)
	))); -- cncf 


create table analysis.cncf_repos as 
SELECT distinct 
		repo_id, 'sandbox' as category 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (166); --,167,168)
		
insert into analysis.cncf_repos 
SELECT distinct 
		repo_id, 'incubating' as category 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (167); --,167,168)
		

insert into analysis.cncf_repos 
SELECT distinct 
		repo_id, 'graduated' as category 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (168); --,167,168)
		
insert into analysis.cncf_repos 
SELECT distinct 
		repo_id, 'incubating' as category 
	FROM
		augur_operations.user_groups,
		augur_operations.user_repos
	WHERE
		augur_operations.user_groups.user_id = 2 
		AND augur_operations.user_repos.group_id = augur_operations.user_groups.group_id 
		AND user_groups.group_id in (241); --,167,168)


create table network_beyond_augur as 
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
		AND user_groups.group_id in (166,167,168)
	)-- cncf 
	) group by cntrb_id, repo_git, repo_name, cntrb_category, action_year, action_quarter;  --63717 64,164
	

/**
Count Rows
**/
select count(*) from analysis.network_sandbox; --3,207,941. 3,215,197
select count(*) from analysis.network_incubating; --3,650,436. 3,659,969
select count(*) from analysis.network_graduated; --5,233,952 5,222,427


CREATE UNIQUE INDEX CONCURRENTLY "labelindex" ON "analysis"."action_types" (
  "action"
);

CREATE UNIQUE INDEX CONCURRENTLY "repo_key1" ON "analysis"."cncf_repos" (
  "repo_id"
);

ALTER TABLE "analysis"."network_graduated" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_id" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_id", "action", "action_year", "action_quarter");


ALTER TABLE "analysis"."network_sandbox" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_id" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_id", "action", "action_year", "action_quarter");
	

ALTER TABLE "analysis"."network_incubating" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_id" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_id", "action", "action_year", "action_quarter");
	
	
CREATE UNIQUE INDEX CONCURRENTLY "repo_id_all1" ON "analysis"."repo_all" (
  "repo_id"
);