## Queries used to count the rows of data collected
```sql
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
```
## Combined row Collection 
```sql
SELECT repo_id, COUNT(*) AS counter, 'pull_requests' AS source FROM pull_requests GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'commits' FROM commits GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'issues' FROM issues GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'issue_message_ref' FROM issue_message_ref GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'pull_request_message_ref' FROM pull_request_message_ref GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'pull_request_review_message_ref' FROM pull_request_review_message_ref GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'message' FROM message GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'repo_dependencies' FROM repo_dependencies GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'repo_labor' FROM repo_labor GROUP BY repo_id
UNION ALL
SELECT repo_id, COUNT(*) AS counter, 'repo_deps_libyear' FROM repo_deps_libyear GROUP BY repo_id;
```

## Improved row collection
```sql 
SELECT
    COALESCE(pr.repo_id, c.repo_id, i.repo_id, im.repo_id, prm.repo_id,
             prrm.repo_id, m.repo_id, rd.repo_id, rl.repo_id, rdl.repo_id) AS repo_id,
    COALESCE(pr.counter, 0) AS counter_prs,
    COALESCE(c.counter, 0) AS counter_commits,
    COALESCE(i.counter, 0) AS counter_issues,
    COALESCE(im.counter, 0) AS counter_issuemsg,
    COALESCE(prm.counter, 0) AS counter_prmsg,
    COALESCE(prrm.counter, 0) AS counter_pre_rev_msg,
    COALESCE(m.counter, 0) AS counter_message,
    COALESCE(rd.counter, 0) AS counter_deps,
    COALESCE(rl.counter, 0) AS counter_labor,
    COALESCE(rdl.counter, 0) AS counter_deps_libyear,
		COALESCE(drv.counter, 0) AS pr_reviews
FROM
    (SELECT repo_id, COUNT(*) AS counter FROM pull_requests GROUP BY repo_id) pr
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM commits GROUP BY repo_id) c USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM issues GROUP BY repo_id) i USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM issue_message_ref GROUP BY repo_id) im USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM pull_request_message_ref GROUP BY repo_id) prm USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM pull_request_review_message_ref GROUP BY repo_id) prrm USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM message GROUP BY repo_id) m USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM repo_dependencies GROUP BY repo_id) rd USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM repo_labor GROUP BY repo_id) rl USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM repo_deps_libyear GROUP BY repo_id) rdl USING (repo_id)
FULL OUTER JOIN (SELECT repo_id, COUNT(*) AS counter FROM pull_request_reviews GROUP BY repo_id) drv USING (repo_id)
ORDER BY repo_id;
```