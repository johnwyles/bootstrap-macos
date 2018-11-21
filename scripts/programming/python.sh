#!/usr/bin/env bash

# Install pyenv (from: https://github.com/joeyhoer/starter)
export GET_PIP_URL="https://bootstrap.pypa.io/get-pip.py"
#export GET_PIP_URL=https://raw.githubusercontent.com/pypa/get-pip/master/get-pip.py
brew install pyenv

export PYTHON_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
export PYTHON2_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')

# export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib"
export CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include"
if [ -d "$(xcrun --show-sdk-path)/usr/include)" ]; then
  export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"
fi

# Install Python versions
pyenv install --skip-existing $PYTHON_LATEST
pyenv install --skip-existing $PYTHON2_LATEST
pyenv global $PYTHON_LATEST $PYTHON2_LATEST
eval "$(pyenv init -)"
pyenv rehash

# Install pip
pyenv global $PYTHON_LATEST $PYTHON2_LATEST
pip install --upgrade pip
pyenv global $PYTHON2_LATEST $PYTHON_LATEST
pip install --upgrade pip
pyenv global $PYTHON_LATEST $PYTHON2_LATEST

# Install pip from web
#curl -fsSL https://bootstrap.pypa.io/get-pip.py | sudo python

# Install virtualenv
pip install virtualenv

pyenv rehash
