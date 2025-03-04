
select * from 
(
select repo_git, now()-core_data_last_collected as oldness, core_status  from augur_operations.collection_status, repo 
where repo.repo_id=augur_operations.collection_status.repo_id
) 
where oldness > INTERVAL '60 days' 
order by oldness desc; -- 3,914 3,925

select * from 
(
select now()-secondary_data_last_collected as oldness, secondary_status from augur_operations.collection_status
) 
where oldness > INTERVAL '60 days' 
order by oldness desc;  --38,199 38,195 38,145 38,007 37,841 37,839 1,889 2,923

select * from 
(
select now()-facade_data_last_collected as oldness, facade_status from augur_operations.collection_status
) 
where oldness > INTERVAL '60 days' 
order by oldness desc; --599 594 541 407 241 239 29  3,762


select * from 
(
select repo_git, now()-core_data_last_collected as oldness, core_status  from augur_operations.collection_status, repo 
where repo.repo_id=augur_operations.collection_status.repo_id
) 
where core_status = 'Collecting'
order by oldness desc; -- 3,914

select core_status, count(*) from augur_operations.collection_status where core_data_last_collected is NULL 
group by core_status
order by core_status; 
/*
core_status	count
Collecting	40
Error	677 685 697 718 724 725 750 764
Pending	1832 1789 1663. 1338 1286 1274 1,187 1,156


*/

select count(*) from message;  --100,384,833  100,447,013 100,469,563 100,534,779 100,567,694