#!/usr/bin/env bash

# Boto3
pip install boto3 --user --no-warn-script-location

# AWS CLI
pip install awscli --user --no-warn-script-location
aws configure

# S3
pip install s3cmd --user --no-warn-script-location
s3cmd --configure
