--SPDX-License-Identifier: MIT

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