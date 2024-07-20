#!/bin/bash

# Stop and remove any existing containers
docker stop redis db worker vote result || true
docker rm redis db worker vote result || true

# Remove any existing images if needed (optional)
# docker rmi redis postgres worker vote result || true

