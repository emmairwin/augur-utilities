
--SPDX-License-Identifier: MIT


--executed as postgres user at command line. 
--CREATE TABLESPACE speed LOCATION '/mnt/bigdata/augur-17';

--This table creates a network of all cntrb_ids within a set of selected user repositories, and then also 
--pulls in available interactions for those users from the wider github network, data which is stored in 
--the contributor_repo table. 
drop table if exists analysis.cncf_in_and_out ; 

CREATE TABLE analysis.cncf_in_and_out 
TABLESPACE speed 
AS
WITH main_actions AS (
    SELECT 
        eca.cntrb_id,
        reverse(c.gh_login),
        eca.repo_id,
        repo.repo_name, 
        repo.repo_git,
        SPLIT_PART(SPLIT_PART(repo.repo_git, 'github.com/', 2), '.git', 1) AS full_repo_context,
        eca.action,
        DATE_TRUNC('day', eca.created_at)::date AS action_day,
        COUNT(*) AS counter,
        TRUE AS is_cncf
    FROM augur_data.explorer_contributor_actions eca
    JOIN augur_data.repo repo ON eca.repo_id = repo.repo_id
    JOIN augur_data.contributors c ON eca.cntrb_id = c.cntrb_id
    WHERE eca.cntrb_id IN (
        SELECT DISTINCT eca_inner.cntrb_id 
        FROM augur_data.explorer_contributor_actions eca_inner
        WHERE eca_inner.repo_id IN (
            SELECT ur.repo_id 
            FROM augur_operations.user_groups ug
            JOIN augur_operations.user_repos ur 
            ON ug.group_id = ur.group_id 
            WHERE ug.user_id = 2 
            AND ug.group_id IN (166, 167, 168)
        )
    )
    GROUP BY eca.cntrb_id, c.gh_login, eca.repo_id, repo.repo_name, repo.repo_git, eca.action, action_day
),
contributor_activity AS (
    SELECT 
        cr.cntrb_id,
        reverse(c.gh_login),
        0 AS repo_id,
        'n/a' AS repo_name,
        cr.repo_git,
        SPLIT_PART(SPLIT_PART(cr.repo_git, 'github.com/', 2), '.git', 1) AS full_repo_context,
        cr.cntrb_category AS action,
        DATE_TRUNC('day', cr.created_at)::date AS action_day,
        COUNT(*) AS counter,
        FALSE AS is_cncf
    FROM augur_data.contributor_repo cr
    JOIN augur_data.contributors c ON cr.cntrb_id = c.cntrb_id
    WHERE cr.cntrb_id IN (SELECT DISTINCT cntrb_id FROM main_actions)
    GROUP BY cr.cntrb_id, c.gh_login, cr.cntrb_category, cr.repo_git, action_day
)
SELECT * FROM main_actions
UNION ALL
SELECT * FROM contributor_activity
ORDER BY cntrb_id, action_day DESC;