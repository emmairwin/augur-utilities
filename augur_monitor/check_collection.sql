
select * from 
(
select repo_git, now()-core_data_last_collected as oldness, core_status  from augur_operations.collection_status, repo 
where repo.repo_id=augur_operations.collection_status.repo_id
) a
where oldness > INTERVAL '60 days' 
order by oldness desc; --  18,628

select * from 
(
select now()-secondary_data_last_collected as oldness, secondary_status from augur_operations.collection_status
) a
where oldness > INTERVAL '60 days' 
order by oldness desc;  --8,810

select * from 
(
select now()-facade_data_last_collected as oldness, facade_status from augur_operations.collection_status
) a
where oldness > INTERVAL '60 days' 
order by oldness desc; --688


select * from 
(
select repo_git, now()-core_data_last_collected as oldness, core_status  from augur_operations.collection_status, repo 
where repo.repo_id=augur_operations.collection_status.repo_id
) a
where core_status = 'Collecting'
order by oldness desc; -- 40

select core_status, count(*) from augur_operations.collection_status where core_data_last_collected is NULL 
group by core_status
order by core_status; 
/*
core_status	count
Collecting	 
Error	7
Pending	335


*/

select count(*) from message;  -- 53,492,162