#!/usr/bin/env bash

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv

# From: https://github.com/joeyhoer/starter
ruby_latest=$(rbenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
rbenv install $ruby_latest
rbenv global $ruby_latest
gem install bundler
rbenv rehash

 # Install the AWS gem
 gem install aws-sdk
