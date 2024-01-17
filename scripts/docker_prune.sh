#!/bin/bash

echo "Prune docker images and volumes"
docker system prune -a
docker system prune -a --volumes
echo "Done with docker prune..."

