#!/bin/bash

. ./scripts/set_envs.sh

set -e

# Rebuild and start the containers
cd $WORKSPACE/matomo
docker compose up --build -d

# . ./scripts/matomo_add_conf.sh

cd $WORKSPACE/nginx
docker compose up --build -d
