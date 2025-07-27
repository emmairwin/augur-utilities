# Tools you can use once the containers are running: 

1. To login to a container: 
```bash
podman exec -it augur_multi_host_augur1_1 /bin/bash
```
Simply change the numbers for each numbered instance

2. To restart the containers: 
```bash
podman compose restart
```
3. To connect to the databases: Using a sql client, the ports are numbered from 7001 to 700n for the number of containers. Everything else is mapped to local host. The default username is `augur` and the default password is `augur`. You can change this by specifying additional informatino in the .env files, which is highly recommended. These additional parameters put everything within your control, though they must be in place for the original `compose --build`.
```bash
AUGUR_DB=augur
AUGUR_DB_USER=augur
AUGUR_DB_PASSWORD=some_password
```