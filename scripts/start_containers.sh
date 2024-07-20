#!/bin/bash

# Set variables
AWS_ACCOUNT_ID="<aws-account-id>"
REGION="<aws-region>"

# Switch to root user
sudo su

# Run the Redis container
docker run -d --name redis redis

# Run the PostgreSQL container
docker run -d -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres --name db postgres

# Run the worker container linking to Redis and PostgreSQL
docker run -d --link redis:redis --link db:db --name worker ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/worker

# Run the voting app container linking to Redis and mapping ports
docker run -d --link redis:redis -p 5000:80 --name vote ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/vote

# Run the result container linking to PostgreSQL and mapping ports
docker run -d --link db:db -p 5001:80 --name result ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/result
