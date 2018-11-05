#!/usr/bin/env bash

# Install macOS SDK headers
if [ -f /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg ]; then
  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
fi

# Install pyenv (from: https://github.com/joeyhoer/starter)
export GET_PIP_URL=https://bootstrap.pypa.io/get-pip.py
#export GET_PIP_URL=https://raw.githubusercontent.com/pypa/get-pip/master/get-pip.py
brew install pyenv
PYTHON_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
PYTHON2_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')
#export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib"
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include"
pyenv install --skip-existing $PYTHON_LATEST
pyenv install --skip-existing $PYTHON2_LATEST
pyenv global $PYTHON_LATEST $PYTHON2_LATEST
eval "$(pyenv init -)"
pyenv rehash

pyenv global $PYTHON_LATEST $PYTHON2_LATEST
pip install --upgrade pip
pyenv global $PYTHON2_LATEST $PYTHON_LATEST
pip install --upgrade pip
pyenv global $PYTHON_LATEST

# Install pip
#curl -fsSL https://bootstrap.pypa.io/get-pip.py | sudo python

pip install virtualenv
pip install virtualenvwrapper
