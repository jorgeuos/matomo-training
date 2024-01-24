#!/bin/bash

set -e

. ./scripts/set_envs.sh

cd $WORKSPACE/matomo

# docker compose exec matomo ls -la plugins
# curl -f -sS https://plugins.matomo.org/api/2.0/plugins/VisitorGenerator/download/latest?matomo=5.0.1 > plugins/VisitorGenerator.zip
# docker compose exec matomo ./console plugin:activate VisitorGenerator



docker compose exec -t matomo ./console development:enable

# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2023-11-27 --days=1
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2023-12-11 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2023-12-18 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2023-12-25 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2024-01-01 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2024-01-08 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2024-01-15 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2024-01-22 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2024-01-22 --days=7 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2023-11-23 --days=1 --ignore-warn
# docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=2023-11-24 --days=1 --ignore-warn
docker compose exec -t matomo ./console visitorgenerator:generate-visits --idsite 2 --limit-fake-visits=10 --custom-matomo-url "https://matomo.gr8.capow.se/" --start-date=yesterday --days=1 --ignore-warn

docker compose exec -t matomo ./console development:disable
# --custom-matomo-url "https://matomo.gr8.capow.se/"



