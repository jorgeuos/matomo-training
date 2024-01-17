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


# ; <?php exit; ?> DO NOT REMOVE THIS LINE
# ; file automatically generated or modified by Matomo; you can manually override the default values in global.ini.php by redefining them in this file.
# [database]
# host = $MATOMO_DATABASE_HOST
# username = $MATOMO_DATABASE_USERNAME
# password = $MATOMO_DATABASE_PASSWORD
# dbname = $MATOMO_DATABASE_DBNAME
# tables_prefix = $MATOMO_TABLES_PREFIX
# charset = "utf8mb4"

# [General]
# assume_secure_protocol = 1
# proxy_client_headers[] = "HTTP_X_FORWARDED_FOR"
# salt = $MATOMO_CONFIG_SALT
# trusted_hosts[] = "matomo.gr8.capow.se"
# trusted_hosts[] = "greatit.se"
# trusted_hosts[] = "web"

echo "Configuring Matomo"
envsubst < static/config.ini.php.template > static/config.ini.php
# docker compose exec matomo ./console config:set --section="database" --key="host" --value=$MATOMO_DATABASE_HOST
# docker compose exec matomo ./console config:set --section="database" --key="username" --value=$MATOMO_DATABASE_USERNAME
# docker compose exec matomo ./console config:set --section="database" --key="password" --value=$MATOMO_DATABASE_PASSWORD
# docker compose exec matomo ./console config:set --section="database" --key="dbname" --value=$MATOMO_DATABASE_DBNAME
# docker compose exec matomo ./console config:set --section="database" --key="tables_prefix" --value=$MATOMO_TABLES_PREFIX
# docker compose exec matomo ./console config:set --section="General" --key="salt" --value=$MATOMO_CONFIG_SALT
# docker compose exec matomo ./console config:set --section="General" --key="trusted_hosts[]" --value="matomo.gr8.capow.se"
# docker compose exec matomo ./console config:set --section="General" --key="trusted_hosts[]" --value="greatit.se"


