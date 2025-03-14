SELECT bl.pid     AS blocked_pid,
     a.usename  AS blocked_user,
     a.query    AS blocked_statement
FROM  pg_catalog.pg_locks         bl
 JOIN pg_catalog.pg_stat_activity a  ON a.pid = bl.pid
WHERE NOT bl.granted
order by blocked_pid; 

--SELECT pg_cancel_backend(3520);

SELECT bl.pid     AS blocked_pid,
     a.usename  AS blocked_user,
     kl.pid     AS blocking_pid,
     ka.usename AS blocking_user,
     a.query    AS blocked_statement
FROM  pg_catalog.pg_locks         bl
 JOIN pg_catalog.pg_stat_activity a  ON a.pid = bl.pid
 JOIN pg_catalog.pg_locks         kl ON kl.transactionid = bl.transactionid AND kl.pid != bl.pid
 JOIN pg_catalog.pg_stat_activity ka ON ka.pid = kl.pid
WHERE NOT bl.granted;

select * from pg_stat_activity 
where pid=21580;
select pid, usename, pg_blocking_pids(pid) as blocked_by,
query as blocked_query
from pg_stat_activity 
where cardinality(pg_blocking_pids(pid)) > 0;