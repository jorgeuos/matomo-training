#!/bin/bash

echo "Performing Matomo core:update"
docker compose exec matomo ./console core:update
echo "Done with Matomo core:update..."

