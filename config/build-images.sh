#!/bin/bash

# This script file is called to build the Docker containers.

# Load the environment variables that customize the build.
source env-vars.sh
echo "Building containers for this repository: "$GATSBY_REPO

# Bring down the Docker containers.
cd ..
/usr/local/bin/docker-compose --project-name $DCNAME down

# Cleanup orphaned images.
./config/cleanup-images.sh

# Rebuild the Docker containers
#/usr/local/bin/docker-compose build
/usr/local/bin/docker-compose build --no-cache

# Run the containers
/usr/local/bin/docker-compose --project-name $DCNAME up -d > ../$DCNAME-build.log

echo "Docker containers have been re-built and are now running"
