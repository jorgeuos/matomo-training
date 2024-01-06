#!/bin/bash
set -e

# Directly substitute environment variables in config.ini.php and overwrite
# envsubst < /var/www/html/config/config.ini.php > /var/www/html/config/config.ini.php
echo "No need to substitute envvars in config.ini.php here, because I do it after the container is started"


# Continue with the standard Matomo entrypoint
exec "/entrypoint.sh" "$@"
