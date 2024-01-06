#!/bin/bash

set -e

. ./scripts/set_envs.sh

cd $WORKSPACE/matomo



for i in {1..30}
do
    docker compose exec matomo ./console user:access --login="testuser-$i" --sites=2 --access=write
done


docker compose exec matomo ./console user:list


