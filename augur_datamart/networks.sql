
--SPDX-License-Identifier: MIT


--executed as postgres user at command line. 
--CREATE TABLESPACE speed LOCATION '/mnt/bigdata/augur-17';

--This table creates a network of all cntrb_ids within a set of selected user repositories, and then also 
--pulls in available interactions for those users from the wider github network, data which is stored in 
--the contributor_repo table. 
create table analysis.cncf_in_and_out 
TABLESPACE speed 
as 
WITH main_actions AS (
    SELECT 
        eca.cntrb_id,
        eca.repo_id,
        repo.repo_name, 
        repo.repo_git,
        eca.action,
        DATE_TRUNC('day', eca.created_at) AS action_day,
        COUNT(*) AS counter,
        'cncf' AS source
    FROM augur_data.explorer_contributor_actions eca
    JOIN augur_data.repo repo ON eca.repo_id = repo.repo_id
    WHERE eca.cntrb_id IN (
        SELECT DISTINCT eca_inner.cntrb_id 
        FROM augur_data.explorer_contributor_actions eca_inner
        WHERE eca_inner.repo_id IN (
            SELECT ur.repo_id 
            FROM augur_operations.user_groups ug
            JOIN augur_operations.user_repos ur 
            ON ug.group_id = ur.group_id 
            WHERE ug.user_id = 2 -- for example
            AND ug.group_id IN (166, 167, 168) --for example
        )
    )
    GROUP BY eca.cntrb_id, eca.repo_id, repo.repo_name, repo.repo_git, eca.action, action_day
),
contributor_activity AS (
    SELECT 
        cr.cntrb_id,
        0 AS repo_id,
        'n/a' AS repo_name,
        repo_git,
        cr.cntrb_category AS action,
        DATE_TRUNC('day', cr.created_at) AS action_day,
        COUNT(*) AS counter,
        'cncf contributor outside cncf' AS source
    FROM augur_data.contributor_repo cr
    WHERE cr.cntrb_id IN (SELECT DISTINCT cntrb_id FROM main_actions)
    GROUP BY cr.cntrb_id, cr.cntrb_category, repo_git, action_day
)
SELECT * FROM main_actions
UNION ALL
SELECT * FROM contributor_activity
ORDER BY cntrb_id, action_day DESC;