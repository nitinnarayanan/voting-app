#!/bin/bash

# Set variables
AWS_ACCOUNT_ID="<aws-account-id>"
REGION="<aws-region>"

# Authenticate Docker to your ECR
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com

# Pull Docker images
docker pull redis
docker pull postgres
docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/result
docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/vote
docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/worker
