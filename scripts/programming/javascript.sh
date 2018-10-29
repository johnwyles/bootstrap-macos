#!/usr/bin/env bash

# Install Node (not recommended)
# brew install node

# Install NVM and Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# Install NVM (not recommended)
# brew install nvm
source ~/.bash_profile

nvm install node
nvm install-latest-npm

# Install and Upgrade NPM
nvm use node
npm install -g npm

# Install the AWS SDK
npm install aws-sdk
