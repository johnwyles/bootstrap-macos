#!/usr/bin/env bash

# Install pyenv (from: https://github.com/joeyhoer/starter)
export GET_PIP_URL="https://bootstrap.pypa.io/get-pip.py"
brew install pyenv

# This is needed for some of the shells underlying scripting
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

export PYTHON_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
# export PYTHON2_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')

# export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib"
export CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include"
export LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include"
if [ -d "$(xcrun --show-sdk-path)/usr/include)" ]; then
  export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"
fi

# Install Python versions
pyenv install --skip-existing $PYTHON_LATEST
#pyenv install --skip-existing $PYTHON2_LATEST
pyenv global $PYTHON_LATEST # $PYTHON2_LATEST
eval "$(pyenv init -)"
pyenv rehash

# Install pip from web
curl -fsSL $GET_PIP_URL | sudo python3

# Install pip
pip install --upgrade pip

# Install virtualenv
pip install virtualenv

# Install poetry
brew install poetry
