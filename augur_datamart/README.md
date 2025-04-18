# This script truncates and repopulates Augur Datamart Tables

Augur datamart tables are summaries of commit activity by year, month and week. All have the prefix `dm_` and are in the `augur_data` schema. 

## [Network Scripts](network-analysis)

There are scripts with the prefix `experimental-networks` and one called `network.sql` that are experimental and used to reshape Augur data into a network structure for analysis. As the names suggest, these are experimental, which means we are not supporting them (much) right now. 

## [Data Mart](datamart-performance-improvement.py)

This script is an efficiency improvement over the [datamart.py](datamart.py) implementation. We recommend that if you run this script manually (i.e., not within the normal execution process of Augur), you first pause data collection. 