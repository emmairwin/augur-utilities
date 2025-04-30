-- Queries used to count the rows of data collected

select repo_id, count(*) as counter_prs from pull_requests
group by repo_id; 

select repo_id, count(*) as counter_commits from commits
group by repo_id; 

select repo_id, count(*) as counter_issues from issues
group by repo_id; 

select repo_id, count(*) as counter_issuemsg from issue_message_ref
group by repo_id; 

select repo_id, count(*) as counter_prmsg from pull_request_message_ref
group by repo_id; 

select repo_id, count(*) as counter_pre_rev_msg from pull_request_review_message_ref
group by repo_id; 

select repo_id, count(*) as counter_message from message
group by repo_id; 

select repo_id, count(*) as counter_deps from repo_dependencies
group by repo_id; 

select repo_id, count(*) as counter_labor from repo_labor
group by repo_id; 

select repo_id, count(*) as counter_deps_libyear from repo_deps_libyear
group by repo_id; 

