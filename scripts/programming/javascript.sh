#!/usr/bin/env bash

# Install Node (not recommended)
# brew install node

# Install NVM
touch ~/.bash_profile
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.bashrc
source ~/.bash_profile

# Install Node and NPM
nvm install node
nvm use node
nvm install-latest-npm
npm install -g npm

# React
brew install watchman
npm install -g react-native-cli

# Install the AWS SDK
npm install -g aws-sdk

# Yarn
npm install -g yarn
