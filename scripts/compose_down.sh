#!/bin/bash

set -e

# Stop the containers
cd matomo
docker compose down
cd ../nginx
docker compose down


