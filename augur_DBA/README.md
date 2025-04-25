# Augur DBA Related Scripts 

1. `contributors-hash-partitioned.sql` : Provides a script that will transform the contributors table to a hash partitioned postgresql table. Hash partitioning enables the database engine to perform a significantly higher volume of parallel inserts because rows across partitions are not locked. This is likely important to any Augur instance with over 60,000 repositories. 
2. `postgresql.conf` : This is a copy of the postgresql 17 configuration file used for Augur scale testing. It contains a number of non-default values focused on maximizing memory utilization. Keep in mind that the instance this is tested on contains over 160,000 repositories, and the server has 1 terabyte of RAM. 

