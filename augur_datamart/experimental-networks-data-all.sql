/**
Count Rows
**/
select count(*) from analysis.network_sandbox; --3,207,941 3,215,236 3,277,115  3,968,506 3,993,785 4,035,830
select count(*) from analysis.network_incubating; --3,650,436 3,661,480 3,739,469 4,549,193 4,586,707 4,630,855
select count(*) from analysis.network_graduated; --5,233,952 5,223,993 5,466,843 8,001,005 8,251,707 8,346,298


/**
Drop tables if they exist 
**/ 
drop table if exists analysis.network_sandbox;  
drop table if exists analysis.network_incubating; 
drop table if exists analysis.network_graduated; 
drop table if exists analysis.action_types;  
drop table if exists analysis.repo_all; 
drop table if exists analysis.cncf_repos;  
drop table if exists analysis.network_beyond_augur; 



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
	AND created_at is not NULL 
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
		
	

create table analysis.network_beyond_augur as 
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
select count(*) from analysis.network_sandbox; --3,207,941. 3,215,197 3,277,115  3,394,643 3,968,506 4,035,830 3855639
select count(*) from analysis.network_incubating; --3,650,436. 3,659,969 3,739,469 3,862,395 4,549,193 4,630,855 4593553
select count(*) from analysis.network_graduated; --5,233,952 5,222,427 5,466,843 5,886,068 8,001,007 8,346,298 8728766

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


ALTER TABLE "analysis"."network_beyond_augur" 
  ALTER COLUMN "cntrb_id" SET NOT NULL,
  ALTER COLUMN "repo_git" SET NOT NULL,
  ALTER COLUMN "repo_name" SET NOT NULL,
  ALTER COLUMN "action" SET NOT NULL,
  ALTER COLUMN "action_year" SET NOT NULL,
  ALTER COLUMN "action_quarter" SET NOT NULL,
  ADD PRIMARY KEY ("cntrb_id", "repo_git", "repo_name", "action", "action_year", "action_quarter");

CREATE INDEX "nba_cntrbid" ON "analysis"."network_beyond_augur" USING btree (
  "cntrb_id"
);

CREATE INDEX "nba-repo-git" ON "analysis"."network_beyond_augur" USING hash (
  "repo_git"
);



/** 
Orgs level networks
**/ 


/**
Count Rows

**/
select count(*) from analysis.network_sandbox_orgs; --11,431,743 11,431,743 11,466,731  11,539,775 12184982
select count(*) from analysis.network_incubating_orgs; --6,316,308 6,416,269 6,463,908 7582381
select count(*) from analysis.network_graduated_orgs; --11,640,989 11,640,987 11,856,802 12,316,534 14137650


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
	and created_at is not null 
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
select count(*) from analysis.network_sandbox_orgs; --11,466,731 11,539,775 12,184,982 12354213
select count(*) from analysis.network_incubating_orgs; --6,416,269 6,463,908 7,582,381 7746695
select count(*) from analysis.network_graduated_orgs; --11,856,802 12,316,534 14,137,650 14454778


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
	
	
CREATE UNIQUE INDEX CONCURRENTLY "repo_id_all_orgs" ON "analysis"."repo_all_orgs" (
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



/**
Dependency Data 
**/ 


/**
193 - sandbox orgs
194 - incubating orgs 
195 - graduated orgs 

166 - sandbox 
167 - incubating 
168 - graduated 
**/ 


drop table if exists analysis.deps_cncf; 
drop table if exists analysis.deps_cncf_orgs; 
drop table if exists analysis.deps_libyear_cncf; 
drop table if exists analysis.deps_libyear_cncf_orgs; 
/**
Collect the most recent enumeration of dependencies. 
The dep_count is a max because it can vary over time 
The data_collection_data is a max because we want the most recent collection 
**/

create table analysis.deps_cncf as 
select repo_id, dep_name, max(dep_count) as dep_count, dep_language, 'sandbox' as cncf_category, max(data_collection_date::date) as most_recent_collection
from repo_dependencies 
WHERE repo_id IN (
SELECT repo_id FROM augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id=166)
group by repo_id, dep_name, dep_language 
order by repo_id, dep_language, dep_name; 

insert into analysis.deps_cncf 
select repo_id, dep_name, max(dep_count) as dep_count, dep_language, 'incubating' as cncf_category, max(data_collection_date::date) as most_recent_collection
from repo_dependencies 
WHERE repo_id IN (
SELECT repo_id FROM augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id=167)
group by repo_id, dep_name, dep_language 
order by repo_id, dep_language, dep_name; 

insert into analysis.deps_cncf 
select repo_id, dep_name, max(dep_count) as dep_count, dep_language,'graduated' as cncf_category, max(data_collection_date::date) as most_recent_collection
from repo_dependencies 
WHERE repo_id IN (
SELECT repo_id FROM augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id=168)
group by repo_id, dep_name, dep_language 
order by repo_id, dep_language, dep_name; 



create table analysis.deps_cncf_orgs as 
select repo_id, dep_name, max(dep_count) as dep_count, dep_language, 'sandbox org' as cncf_category, max(data_collection_date::date) as most_recent_collection
from repo_dependencies 
WHERE repo_id IN (
SELECT repo_id FROM augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id=193)
group by repo_id, dep_name, dep_language 
order by repo_id, dep_language, dep_name; 

insert into analysis.deps_cncf_orgs 
select repo_id, dep_name, max(dep_count) as dep_count, dep_language, 'incubating org' as cncf_category, max(data_collection_date::date) as most_recent_collection
from repo_dependencies 
WHERE repo_id IN (
SELECT repo_id FROM augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id=194)
group by repo_id, dep_name, dep_language 
order by repo_id, dep_language, dep_name; 

insert into analysis.deps_cncf_orgs 
select repo_id, dep_name, max(dep_count) as dep_count, dep_language,'graduated org' as cncf_category, max(data_collection_date::date) as most_recent_collection
from repo_dependencies 
WHERE repo_id IN (
SELECT repo_id FROM augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id=195)
group by repo_id, dep_name, dep_language 
order by repo_id, dep_language, dep_name; 


/**
Repo_deps_libyear dependency data 
core cncf repository level 
**/ 

create table analysis.deps_libyear_cncf as 
select a.repo_id, name as dep_name, 'sandbox' as cncf_category, 
requirement, type, package_manager, current_verion as current_version, latest_version, libyear, max(a.data_collection_date::date) as data_collection_date 
from repo_deps_libyear a,  
	(select repo_id, max(data_collection_date::date) as data_collection_date 
	from repo_deps_libyear
	group by repo_id) b 
where b.repo_id=a.repo_id
and a.data_collection_date::date = b.data_collection_date::date 
and a.repo_id in 
(select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (166)) 
group by a.repo_id, dep_name, requirement, type, package_manager, current_verion, latest_version, libyear
order by a.repo_id, package_manager, dep_name; 

insert into analysis.deps_libyear_cncf  
select a.repo_id, name as dep_name,  'incubating' as cncf_category, 
requirement, type, package_manager, current_verion as current_version, latest_version, libyear, max(a.data_collection_date::date) as data_collection_date 
from repo_deps_libyear a,  
	(select repo_id, max(data_collection_date::date) as data_collection_date 
	from repo_deps_libyear
	group by repo_id) b 
where b.repo_id=a.repo_id
and a.data_collection_date::date = b.data_collection_date::date 
and a.repo_id in 
(select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (167)) 
group by a.repo_id, dep_name, requirement, type, package_manager, current_verion, latest_version, libyear
order by a.repo_id, package_manager, dep_name; 

insert into analysis.deps_libyear_cncf 
select a.repo_id, name as dep_name, 'graduated' as cncf_category, 
requirement, type, package_manager, current_verion as current_version, latest_version, libyear, max(a.data_collection_date::date) as data_collection_date 
from repo_deps_libyear a,  
	(select repo_id, max(data_collection_date::date) as data_collection_date 
	from repo_deps_libyear
	group by repo_id) b 
where b.repo_id=a.repo_id
and a.data_collection_date::date = b.data_collection_date::date 
and a.repo_id in 
(select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (168)) 
group by a.repo_id, dep_name, requirement, type, package_manager, current_verion, latest_version, libyear
order by a.repo_id, package_manager, dep_name; 


/**
repo_deps_libyear at the cncf org level 

**/ 

create table analysis.deps_libyear_cncf_orgs as 
select a.repo_id, name as dep_name, 'sandbox_org' as cncf_category, 
requirement, type, package_manager, current_verion as current_version, latest_version, libyear, max(a.data_collection_date::date) as data_collection_date 
from repo_deps_libyear a,  
	(select repo_id, max(data_collection_date::date) as data_collection_date 
	from repo_deps_libyear
	group by repo_id) b 
where b.repo_id=a.repo_id
and a.data_collection_date::date = b.data_collection_date::date 
and a.repo_id in 
(select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (193)) 
group by a.repo_id, dep_name, requirement, type, package_manager, current_verion, latest_version, libyear
order by a.repo_id, package_manager, dep_name; 

insert into analysis.deps_libyear_cncf_orgs  
select a.repo_id, name as dep_name, 'incubating_org' as cncf_category, 
requirement, type, package_manager, current_verion as current_version, latest_version, libyear, max(a.data_collection_date::date) as data_collection_date 
from repo_deps_libyear a,  
	(select repo_id, max(data_collection_date::date) as data_collection_date 
	from repo_deps_libyear
	group by repo_id) b 
where b.repo_id=a.repo_id
and a.data_collection_date::date = b.data_collection_date::date 
and a.repo_id in 
(select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (194)) 
group by a.repo_id, dep_name, requirement, type, package_manager, current_verion, latest_version, libyear
order by a.repo_id, package_manager, dep_name; 

insert into analysis.deps_libyear_cncf_orgs 
select a.repo_id, name as dep_name, 'graduated_org' as cncf_category, 
requirement, type, package_manager, current_verion as current_version, latest_version, libyear, max(a.data_collection_date::date) as data_collection_date 
from repo_deps_libyear a,  
	(select repo_id, max(data_collection_date::date) as data_collection_date 
	from repo_deps_libyear
	group by repo_id) b 
where b.repo_id=a.repo_id
and a.data_collection_date::date = b.data_collection_date::date 
and a.repo_id in 
(select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (195)) 
group by a.repo_id, dep_name, requirement, type, package_manager, current_verion, latest_version, libyear
order by a.repo_id, package_manager, dep_name; 

ALTER TABLE "analysis"."deps_cncf_orgs" 
  ALTER COLUMN "repo_id" SET NOT NULL,
  ALTER COLUMN "dep_name" SET NOT NULL,
  ALTER COLUMN "dep_count" SET NOT NULL,
  ALTER COLUMN "dep_language" SET NOT NULL,
  ALTER COLUMN "cncf_category" SET NOT NULL,
  ADD PRIMARY KEY ("repo_id", "dep_name", "dep_count", "dep_language", "cncf_category");
	
	
	
/**

select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (166); 


select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (167); 

select distinct repo_id from 
augur_operations.user_groups,augur_operations.user_repos 
	WHERE augur_operations.user_groups.user_id=2 
	AND augur_operations.user_repos.group_id=augur_operations.user_groups.group_id 
	AND user_groups.group_id in (168); 
**/ 