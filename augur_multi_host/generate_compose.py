import sys

# Usage: python3 generate_compose.py /path/to/augur/clone
# If no path is given, defaults to current directory.

instances = 8
augur_path = sys.argv[1] if len(sys.argv) > 1 else '.'

template = """version: '3.8'

services:
{services}
volumes:
{volumes}
networks:
{networks}
"""

service_block = """
  augur{i}-db:
    image: postgres:17
    restart: unless-stopped
    environment:
      - POSTGRES_DB=augur
      - POSTGRES_USER=augur
      - POSTGRES_PASSWORD=augur
      - PGDATA=/var/lib/postgresql/data/pgdata
    ports:
      - "{pg_port}:5432"
    volumes:
      - augur{i}-postgres:/var/lib/postgresql/data
    networks: [augur{i}]

  augur{i}-redis:
    image: redis:alpine
    networks: [augur{i}]

  augur{i}-keyman:
    image: augur-keyman
    build:
      context: {augur_path}
      dockerfile: ./docker/keyman/Dockerfile
    environment:
      - REDIS_CONN_STRING=redis://augur{i}-redis:6379
    depends_on:
      - augur{i}-redis
    networks: [augur{i}]
    user: 3456:3456

  augur{i}-rabbitmq:
    image: augur-rabbitmq
    build:
      context: {augur_path}
      dockerfile: ./docker/rabbitmq/Dockerfile
      args:
        - RABBIT_MQ_DEFAULT_USER=augur
        - RABBIT_MQ_DEFAULT_PASSWORD=password123
        - RABBIT_MQ_DEFAULT_VHOST=augur_vhost
    networks: [augur{i}]

  augur{i}:
    image: augur-new:latest
    build:
      context: {augur_path}
      dockerfile: ./docker/backend/${{AUGUR_TARGET:-Dockerfile}}
    restart: unless-stopped
    ports:
      - "{api_port}:5000"
    volumes:
      - augur{i}-cache:/cache:rw
      - augur{i}-config:/config:rw
      - augur{i}-facade:/facade:rw
      - augur{i}-logs:/logs:rw
    environment:
      - AUGUR_DB=postgresql+psycopg2://augur:augur@augur{i}-db:5432/augur
      - AUGUR_DB_SCHEMA_BUILD=1
      - AUGUR_FACADE_REPO_DIRECTORY=/facade
      - REDIS_CONN_STRING=redis://augur{i}-redis:6379
      - RABBITMQ_CONN_STRING=amqp://augur:password123@augur{i}-rabbitmq:5672/augur_vhost
      - CONFIG_LOCATION=/config/config.yml
      - CACHE_DATADIR=/cache
      - CACHE_LOCKDIR=/cache
      - CELERYBEAT_SCHEDULE_DB=/tmp/celerybeat-schedule.db
    depends_on:
      - augur{i}-db
      - augur{i}-redis
      - augur{i}-keyman
      - augur{i}-rabbitmq
    networks: [augur{i}]
    user: 2345:2345
"""

services, volumes, networks = "", "", ""
for i in range(1, instances+1):
    services += service_block.format(i=i, pg_port=7000+i, api_port=6000+i, augur_path=augur_path)
    volumes += f"""  augur{i}-postgres:\n  augur{i}-cache:\n  augur{i}-config:\n  augur{i}-facade:\n  augur{i}-logs:\n"""
    networks += f"  augur{i}:\n"

with open("docker-compose.yml", "w") as f:
    f.write(template.format(services=services, volumes=volumes, networks=networks))

print(f"docker-compose.yml generated successfully with Augur path: {augur_path}")