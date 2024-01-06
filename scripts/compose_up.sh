#!/bin/bash

. ./scripts/set_envs.sh

set -e

# Start the containers
cd $WORKSPACE/matomo
docker compose up -d

cd $WORKSPACE
# . ./scripts/matomo_add_conf.sh

cd $WORKSPACE/nginx
docker compose up -d

