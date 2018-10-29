#!/usr/bin/env bash

# Run with:
#   (optional) If you have a fork of this repository set this first:
#GITHUB_USERNAME="your_github_username"
# Execute:
#  GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
#  sh -c "$(curl -fsSL https://raw.githubusercontent.com/$GITHUB_USERNAME/bootstrap-macos/master/remote_install.sh)"

GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
mkdir -p ~/.bootstrap-macos
git clone git@github.com:$GITHUB_USERNAME/bootstrap-macos.git ~/.bootstrap-macos
pushd ~/.bootstrap-macos
./setup.sh
popd
