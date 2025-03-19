-- Step 1: Check if the DELETE is blocked by other queries
SELECT pid, age(clock_timestamp(), query_start) AS duration, state, wait_event_type, wait_event, query
FROM pg_stat_activity
WHERE query ILIKE '%DELETE%'
ORDER BY query_start;

-- Step 2: Check if foreign keys might be causing cascading delays
SELECT conrelid::regclass AS table_name, confrelid::regclass AS referenced_table, confdeltype
FROM pg_constraint
WHERE contype = 'f' AND conrelid = 'augur_data.pull_request_reviews'::regclass;

-- Step 3: Check if indexes exist on WHERE conditions used in DELETEs
SELECT indexrelid::regclass AS index_name, indrelid::regclass AS table_name, indisunique AS unique_index
FROM pg_index
WHERE indrelid = 'augur_data.pull_request_reviews'::regclass;

-- Step 4: Check the size of the table and how many dead tuples exist
SELECT 
    psat.relname, 
    psat.n_live_tup, 
    psat.n_dead_tup, 
    pg_size_pretty(pg_relation_size(pc.oid)) AS table_size
FROM pg_stat_all_tables psat
JOIN pg_class pc ON psat.relname = pc.relname
WHERE psat.relname = 'augur_data.pull_request_reviews';

-- Step 5: Check autovacuum activity that may interfere with DELETEs
SELECT relname, last_vacuum, last_autovacuum, last_analyze, last_autoanalyze
FROM pg_stat_user_tables
WHERE relname = 'augur_data.pull_request_reviews';

-- Step 6: Check for long-running transactions that might be preventing VACUUM
SELECT pid, age(clock_timestamp(), xact_start) AS duration, state, query
FROM pg_stat_activity
WHERE state IN ('active', 'idle in transaction') ORDER BY xact_start;

--table bloat 
SELECT 
    pc.relname AS table_name, 
    n_live_tup, 
    n_dead_tup, 
    pg_size_pretty(pg_relation_size(pc.oid)) AS table_size
FROM pg_stat_all_tables psat
JOIN pg_class pc ON psat.relname = pc.relname
WHERE psat.relname = 'pull_request_reviews';

-- checking index on reop_id 
SELECT indexrelid::regclass AS index_name
FROM pg_index
WHERE indrelid = 'pull_request_reviews'::regclass;

-- checking for foreign index key constraints without an index. 
SELECT conrelid::regclass AS table_name, confrelid::regclass AS referenced_table, confdeltype
FROM pg_constraint
WHERE contype = 'f' AND conrelid = 'pull_request_reviews'::regclass;