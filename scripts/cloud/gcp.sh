#!/usr/bin/env bash

# Install all SDKs
brew install --cask google-cloud-sdk
# curl -o google-cloud-sdk-324.0.0-darwin-x86_64.tar.gz -k https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-324.0.0-darwin-x86_64.tar.gz
# tar zxvf google-cloud-sdk-324.0.0-darwin-x86_64.tar.gz
# ~/.

pip install --upgrade google-api-python-client --no-warn-script-location
pip install --upgrade google-cloud --no-warn-script-location

# Install some components
gcloud components --quiet install core gsutil kubectl

# Prompt for configuraiton
gcloud init
