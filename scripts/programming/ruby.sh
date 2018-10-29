#!/usr/bin/env bash

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q -F "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install bundler
gem install bundler

# Install the AWS gem
gem install aws-sdk
