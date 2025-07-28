#!/usr/bin/env bash
# Usage: ./psql_container.sh 3
# Connects to augur_multi_host_augur3-db_1 via psql

if [ -z "$1" ]; then
  echo "Usage: $0 <instance-number>"
  exit 1
fi

INSTANCE=$1
CONTAINER="augur_multi_host_augur${INSTANCE}-db_1"

echo "Connecting to $CONTAINER ..."
podman exec -it "$CONTAINER" psql -U augur