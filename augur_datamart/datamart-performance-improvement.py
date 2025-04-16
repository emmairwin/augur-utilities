import psycopg2
import json

CONFIG_FILE = "db.config.json"

TABLE_CONFIGS = [
    {
        "table": "dm_repo_weekly",
        "group_field": "repo_id",
        "time_unit": "'week'",
        "period_column": "week"
    },
    {
        "table": "dm_repo_monthly",
        "group_field": "repo_id",
        "time_unit": "'month'",
        "period_column": "month"
    },
    {
        "table": "dm_repo_annual",
        "group_field": "repo_id",
        "time_unit": "'year'",
        "period_column": "year"
    },
    {
        "table": "dm_repo_group_weekly",
        "group_field": "repo_group_id",
        "time_unit": "'week'",
        "period_column": "week"
    },
    {
        "table": "dm_repo_group_monthly",
        "group_field": "repo_group_id",
        "time_unit": "'month'",
        "period_column": "month"
    },
    {
        "table": "dm_repo_group_annual",
        "group_field": "repo_group_id",
        "time_unit": "'year'",
        "period_column": "year"
    }
]

QUERY_TEMPLATE = """
WITH base_info AS (
  SELECT 'manual query' AS tool_source, '1.0' AS tool_version, 'query' AS data_source
),
filtered_commits AS (
  SELECT
    c.repo_id,
    r.repo_group_id,
    c.cmt_author_email,
    c.cmt_author_affiliation,
    TO_TIMESTAMP(c.cmt_committer_date, 'YYYY-MM-DD') AS commit_ts,
    c.cmt_added,
    c.cmt_removed,
    c.cmt_whitespace,
    c.cmt_filename,
    c.cmt_commit_hash
  FROM augur_data.commits c
  JOIN augur_data.repo r ON c.repo_id = r.repo_id
  JOIN augur_data.repo_groups g ON r.repo_group_id = g.repo_group_id
  WHERE NOT EXISTS (
    SELECT 1 FROM augur_data.exclude e
    WHERE (
      (c.cmt_author_email = e.email OR c.cmt_author_email LIKE CONCAT('%', e.domain))
      AND (e.projects_id = r.repo_group_id OR e.projects_id = 0)
    )
  )
),
aggs AS (
  SELECT
    fc.repo_id,
    fc.repo_group_id,
    fc.cmt_author_email AS email,
    fc.cmt_author_affiliation AS affiliation,
    DATE_PART({time_unit}, fc.commit_ts) AS period,
    DATE_PART('year', fc.commit_ts) AS year,
    SUM(fc.cmt_added) AS added,
    SUM(fc.cmt_removed) AS removed,
    SUM(fc.cmt_whitespace) AS whitespace,
    COUNT(DISTINCT fc.cmt_filename) AS files,
    COUNT(DISTINCT fc.cmt_commit_hash) AS patches
  FROM filtered_commits fc
  GROUP BY
    fc.repo_id,
    fc.repo_group_id,
    fc.cmt_author_email,
    fc.cmt_author_affiliation,
    DATE_PART({time_unit}, fc.commit_ts),
    DATE_PART('year', fc.commit_ts)
)
INSERT INTO augur_data.{table} (
  {group_field},
  email,
  affiliation,
  {period_column},
  year,
  added,
  removed,
  whitespace,
  files,
  patches,
  tool_source,
  tool_version,
  data_source
)
SELECT
  {group_field},
  a.email,
  a.affiliation,
  a.period,
  a.year,
  a.added,
  a.removed,
  a.whitespace,
  a.files,
  a.patches,
  bi.tool_source,
  bi.tool_version,
  bi.data_source
FROM aggs a, base_info bi;
"""

def read_db_config():
    with open(CONFIG_FILE, 'r') as f:
        return json.load(f)

def run_queries():
    config = read_db_config()
    conn = psycopg2.connect(
        host=config['host'],
        port=config['port'],
        dbname=config['dbname'],
        user=config['user'],
        password=config['password']
    )
    cursor = conn.cursor()

    for cfg in TABLE_CONFIGS:
        print(f"Truncating {cfg['table']}...")
        cursor.execute(f"TRUNCATE TABLE augur_data.{cfg['table']};")
        
        query = QUERY_TEMPLATE.format(
            table=cfg['table'],
            group_field=cfg['group_field'],
            time_unit=cfg['time_unit'],
            period_column=cfg['period_column']
        )
        print(f"Inserting into {cfg['table']}...")
        cursor.execute(query)
        conn.commit()

    cursor.close()
    conn.close()

if __name__ == '__main__':
    run_queries()
