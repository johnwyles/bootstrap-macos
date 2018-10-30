#!/usr/bin/env bash

# Run with:
#   (optional) If you have a fork of this repository set this first:
#export GITHUB_USERNAME="your_github_username"
# Execute:
#  export GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
#  sh -c "$(curl -fsSL https://raw.githubusercontent.com/$GITHUB_USERNAME/bootstrap-macos/master/remote_install.sh)"

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until we finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
mkdir -p ~/.bootstrap-macos
git clone git@github.com:$GITHUB_USERNAME/bootstrap-macos.git ~/.bootstrap-macos
pushd ~/.bootstrap-macos
./setup.sh
popd
