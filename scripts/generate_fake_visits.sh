#!/bin/bash

set -e

. ./scripts/set_envs.sh

cd $WORKSPACE/matomo

# docker compose exec matomo ls -la plugins
# docker compose exec matomo ./console plugin:activate VisitorGenerator

docker compose exec -t matomo ./console development:enable

docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=today --days=1

docker compose exec -t matomo ./console development:disable
# --custom-matomo-url "https://matomo.gr8.capow.se/"



