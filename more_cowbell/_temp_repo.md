select repo_id, repo_src_id, repo_git
from augur_data.repo 
where repo_id in 
(
257479,
36598,
149077,
36237,
165630); 

select * from repo 
where repo_git in 
(
select repo_git from repo 
where repo_id in 
(
257479,
36598,
149077,
36237,
165630));

