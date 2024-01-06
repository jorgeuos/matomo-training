#!/bin/bash
# ./scripts/compose_exec_config.sh

set -e

# Stop the containers
cd matomo
docker compose exec matomo head -n20  /var/www/html/config/config.ini.php
# docker compose exec matomo tail /var/www/html/config/config.ini.php


