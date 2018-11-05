#!/usr/bin/env bash

# Install macOS SDK headers
if [ -f /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg ]; then
  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
fi

# Install pyenv (from: https://github.com/joeyhoer/starter)
export GET_PIP_URL=https://raw.githubusercontent.com/pypa/get-pip/master/get-pip.py
brew install pyenv
PYTHON2_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')
PYTHON_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib"
pyenv install --skip-existing $PYTHON2_LATEST
pyenv install --skip-existing $PYTHON_LATEST
pyenv global $PYTHON_LATEST $PYTHON2_LATEST
eval "$(pyenv init -)"
pyenv rehash

# Install pip
#curl -fsSL https://bootstrap.pypa.io/get-pip.py | sudo python

pip install virtualenv
pip install virtualenvwrapper
