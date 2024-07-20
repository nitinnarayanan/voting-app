# 🚀 Voting App CI/CD Pipeline on AWS <img src="https://skillicons.dev/icons?i=aws" width="30">


This project demonstrates the implementation of a Continuous Integration and Continuous Delivery (CI/CD) pipeline on Amazon Web Services (AWS) for a voting application (Original source: https://github.com/dockersamples/example-voting-app). The voting application is a multi-container application that includes various components written in different languages.

## Overview

This solution uses AWS services to create a CI/CD pipeline that automatically updates your application running on Amazon EC2 whenever a code change is committed to the configured AWS Codecommit repository branch.

## Architecture

The architecture includes the following AWS services:

- **AWS CodeCommit**: Stores the source code.
- **AWS CodePipeline**: Manages the CI/CD pipeline with source, build, and deploy stages.
- **Amazon S3**: Stores pipeline artifacts.
- **AWS CodeBuild**: Builds the source code into a Docker container image.
- **AWS Systems Manager**: Manages temporary Amazon EC2 instances used during the build process.
- **Amazon ECR**: Stores Docker container images.
- **AWS CodeDeploy**: Deploys the Docker container images to Amazon EC2.

Check out our architecture diagram for a clearer view:

![image](https://github.com/user-attachments/assets/5b1da414-23bb-43d9-90df-d686a47c58c8)

This project sets up a continuous integration and continuous delivery (CI/CD) pipeline on Amazon Web Services (AWS) for the voting application running on Amazon EC2. The application is automatically updated whenever code is modified in the specified AWS CodeCommit repository branch, ensuring seamless operation without interrupting the Amazon ECS service.

AWS CodePipeline manages the CI/CD process, consisting of source, build, and deploy stages. In the source stage, code is fetched from AWS CodeCommit and stored in Amazon Simple Storage Service (Amazon S3). During the build stage, AWS CodeBuild and AWS Systems Manager create a new Docker container image <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/Docker.svg" width="16"> on a temporary Amazon Elastic Compute Cloud (Amazon EC2) instance. In the deploy stage, AWS CodeDeploy updates the application by deploying the new image to Amazon EC2.

## Process Overview

AWS CodePipeline manages the CI/CD process, consisting of source, build, and deploy stages:

1. **Source Stage**: Code is fetched from AWS CodeCommit and stored in Amazon Simple Storage Service (Amazon S3).
2. **Build Stage**: AWS CodeBuild and AWS Systems Manager create a new Docker container image on a temporary Amazon Elastic Compute Cloud (Amazon EC2) instance.
3. **Deploy Stage**: AWS CodeDeploy updates the application by deploying the new image to Amazon EC2.

## Components

The voting application consists of:

- **Front-end web app (Python)**: Lets users vote between two options. <img src="https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/files/python-logo-only.svg" width="20">
- **Redis**: Collects new votes. <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/Redis-Dark.svg" width="20">
- **.NET worker**: Consumes votes and stores them in a database. <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/DotNet.svg" width="20">
- **Postgres**: Database backed by a Docker volume. <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/PostgreSQL-Dark.svg" width="20">
- **Node.js web app**: Shows the voting results in real-time. <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/NodeJS-Dark.svg" width="20">

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account 🌐
- AWS CLI configured 
- GitHub account 🐙
- Docker installed locally for testing 🐳
