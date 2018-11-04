#!/usr/bin/env bash

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv

# Install rbenv and bundler (from: https://github.com/joeyhoer/starter)
ruby_latest=$(rbenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
#curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
rbenv install $ruby_latest
rbenv global $ruby_latest
eval "$(rbenv init -)"
gem install bundler
rbenv rehash

# Install the AWS gem
gem install aws-sdk
