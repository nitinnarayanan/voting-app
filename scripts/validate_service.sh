#!/bin/bash

sudo su

# Check if the containers are running
if [ $(docker ps -q -f name=redis) ] && \
   [ $(docker ps -q -f name=db) ] && \
   [ $(docker ps -q -f name=worker) ] && \
   [ $(docker ps -q -f name=vote) ] && \
   [ $(docker ps -q -f name=result) ]; then
  echo "All containers are running."
else
  echo "One or more containers failed to start."
  exit 1
fi

# Optionally, you can add more checks such as health checks for each service

