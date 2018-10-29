#!/usr/bin/env bash

# Install all SDKs
brew tap caskroom/cask
brew cask install google-cloud-sdk

pip install --upgrade google-api-python-client --user --no-warn-script-location
pip3 install --upgrade google-api-python-client --user --no-warn-script-location
pip install --upgrade google-cloud --user --no-warn-script-location
pip3 install --upgrade google-cloud --user --no-warn-script-location

# Install some components
gcloud components install core gsutil kubectl

# Prompt for configuraiton
gcloud init
