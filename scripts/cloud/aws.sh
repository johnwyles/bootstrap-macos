#!/usr/bin/env bash

# Boto3
pip install boto3 --no-warn-script-location

# AWS CLI
pip install awscli --no-warn-script-location
aws configure

# S3
pip install s3cmd --no-warn-script-location
s3cmd --configure

# SAM
brew tap aws/tap
brew install aws-sam-cli
