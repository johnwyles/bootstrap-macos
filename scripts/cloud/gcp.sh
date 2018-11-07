#!/usr/bin/env bash

# Install all SDKs
brew cask install google-cloud-sdk

pip install --upgrade google-api-python-client --user --no-warn-script-location
pip install --upgrade google-cloud --user --no-warn-script-location

# Install some components
gcloud components --quiet install core gsutil kubectl

# Prompt for configuraiton
gcloud init
