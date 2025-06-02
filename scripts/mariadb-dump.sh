#!/bin/sh
today=$(date +"%Y-%m-%d")
cd /opt/scripts
mkdir -p $today
docker compose -f /opt/svc/docker-compose.yaml exec mariadb sh -c "mkdir -p /backup && rm -rf /backup/* && mariadb-dump --all-databases -u root -p"\$MARIADB_ROOT_PASSWORD" > /backup/db.sql"
docker compose -f /opt/svc/docker-compose.yaml cp mariadb:/backup/db.sql ./$today
docker compose -f /opt/svc/docker-compose.yaml exec mariadb sh -c "rm -rf /backup/*"
