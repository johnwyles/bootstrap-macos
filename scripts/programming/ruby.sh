#!/usr/bin/env bash

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv

# Install rbenv and bundler (from: https://github.com/joeyhoer/starter)
export RUBY_LATEST=$(rbenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')

# Run rbenv doctor
#curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib"
export CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include"
if [ -d "$(xcrun --show-sdk-path)/usr/include)" ]; then
  export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"
fi

RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)" rbenv install  $RUBY_LATEST
rbenv global $RUBY_LATEST
eval "$(rbenv init -)"

# Install bundler
gem install bundler

# Install the AWS gem
gem install aws-sdk

rbenv rehash
