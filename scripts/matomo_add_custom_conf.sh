#!/bin/bash
# USE THIS INSTEAD OF matomo_copy_conf.sh


set -e

. ./scripts/set_envs.sh

cd $WORKSPACE/matomo

echo "Fix correct vars for Matomo"
if [ -f .env ]
then
    echo ".env file found!"
    export $(cat .env | sed 's/#.*//g' | xargs)
else
    echo "No .env file found, you need an .env file to run this script"
fi

docker compose exec matomo ./console config:set --section="General" --key="emails_enabled" --value="0"






