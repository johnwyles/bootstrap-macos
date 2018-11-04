#!/usr/bin/env bash

# Install pyenv
brew install pyenv

# From: https://github.com/joeyhoer/starter
PYTHON2_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')
PYTHON_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
pyenv install --skip-existing $PYTHON2_LATEST
pyenv install --skip-existing $PYTHON_LATEST
pyenv rehash
pyenv global $PYTHON_LATEST $PYTHON2_LATEST

# Install pip
curl https://bootstrap.pypa.io/get-pip.py | sudo python

pip install virtualenv
pip install virtualenvwrapper
