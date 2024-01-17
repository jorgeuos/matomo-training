#!/bin/bash

# Define the container names
MATOMO_CONTAINER="matomo-matomo-1"
# Alternatively, you can get the container name:
# MATOMO_CONTAINER=$(docker ps --filter "ancestor=matomo:5.0.1" --format "{{.Names}}" | head -n 1)

DB_CONTAINER="matomo-db-1"

# Define the backup directory on the host
BACKUP_DIR="./backups"

. ./matomo/.env
# Database credentials
DB_NAME=${MATOMO_DATABASE_DBNAME}
DB_USER=root
DB_PASSWORD=${MATOMO_ROOT_PASSWORD}

echo "DB CREDS:"
echo $DB_NAME
echo $DB_USER
echo $DB_PASSWORD

# Get current date and time for the backup filename
CURRENT_DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup the plugins folder
docker exec $MATOMO_CONTAINER tar czf - /var/www/html/plugins > "${BACKUP_DIR}/plugins_backup_${CURRENT_DATE}.tar.gz"

# Backup the config folder
docker exec $MATOMO_CONTAINER tar czf - /var/www/html/config > "${BACKUP_DIR}/config_backup_${CURRENT_DATE}.tar.gz"

# Backup the MySQL database
docker exec $DB_CONTAINER mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > "${BACKUP_DIR}/${DB_NAME}_${CURRENT_DATE}.sql"

echo "Backup completed. Files are stored in ${BACKUP_DIR}"
