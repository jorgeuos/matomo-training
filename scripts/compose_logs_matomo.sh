#!/bin/bash

set -e

# Logs the containers
cd matomo
docker compose logs -f --tail=100 matomo


