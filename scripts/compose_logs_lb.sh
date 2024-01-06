#!/bin/bash

set -e

# Logs the containers
cd nginx
docker compose logs -f --tail=100 web
