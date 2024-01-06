#!/bin/bash


# NO NOT USE THIS SCRIPT
# THIS IS NOT WORKING


set -e

. ./scripts/set_envs.sh

cd $WORKSPACE/matomo


rm ./static/config.ini.php

echo "Fix correct vars for Matomo"
if [ -f .env ]
then
    echo ".env file found!"
    export $(cat .env | sed 's/#.*//g' | xargs)
else
    echo "No .env file found, you need an .env file to run this script"
fi

# Replace envvars
envsubst < ./static/config.ini.php.template > ./static/config.ini.php

# Debug
# head ./static/config.ini.php


# THIS IS NOT WORKING
# copy the config.ini.php file to the container
docker cp ./static/config.ini.php matomo-matomo-1:/var/www/html/config/config.ini.php

docker restart matomo-matomo-1

