#!/bin/bash

set -e

. ./scripts/set_envs.sh

cd $WORKSPACE/matomo



# Genereate 30 users
for i in {1..4}
do
  docker compose exec matomo ./console user:create --login="testuser-$i" --password="test-pass-$i" --email="testuser-$i@example.com"
done

# docker compose exec matomo ./console user:create --help

docker compose exec matomo ./console user:list
