# augur-utilities                           ![image](./augur-utilties.png)

Utilities for working with Augur data. 
1. [Tod Do Group Repo Linter (at scale)](./repo_linter/)
2. [Augur Data Collection Evaluation Queries](./augur_monitor/)
3. [Cleaning up Duplicate Repositories (Legacy Augur Instance Repair)](./more_cowbell/)`+`
4. [Hash Encryption of Email](./email_hasher/)
5. [Clone a Bunch of Repos](./repo_cloner/)
6. [Augur DBA Tools](./augur_DBA/)
7. [Augur Datamart and Network Analysis Table Creation](./augur_datamart/)
8. [Augur Scanner with Scancode](./augur_scancode/)
9. [Augur System Administrator](./augur_sysadmin/)`🐠`
10. [Augur Testing](./augur_testing/)`🙀`

Use the issues tab in this repo if there's a utility you would like to see. 

`+` This script is only necessary on instances of Augur that began collecting data before May, 2024. That does not mean it's required, however it does mean that new instances will not have to worry about this at all. Duplicate repos were only introduced in very specific circumstances where GitHub org addition and repo movement to new URL's were not addressed in concert. 

`🐠` - Augur system administrator addresses maintenance and trouble shooting around the distributed components that make up an operational and growing Augur instance. RabbitMQ, Redis/Valkey and Postgresql troubleshooting are included. 

`🙀` - Augur testing provides simple scripts for evaluating the non-deterministic aspects of Augur, which include its principle aim of collecting open source software health and sustainability data. 
