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
# Update the OS and Install Xcode Tools
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running update of macOS: ./setup.sh"
echo "    (restart if needed and run this script again): ./setup.sh"
echo
sudo softwareupdate -ia --verbose

# Xcode CLI tools
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Xcode CLI tools:"
echo    "./setup.sh"
echo
# Install Xcode Command Line Tools
if ! $(xcode-select -p &>/dev/null); then
  xcode-select --install &>/dev/null
  # Wait until the Xcode Command Line Tools are installed
  until $(xcode-select -p &>/dev/null); do
    sleep 5
  done
fi
# Accept the Xcode/iOS license agreement
if ! $(sudo xcodebuild -license status); then
  sudo xcodebuild -license accept
else
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m You must install the Xcode CLI tools first"
  open "https://developer.apple.com/downloads/more"
  exit
fi

git clone git@github.com:$GITHUB_USERNAME/bootstrap-macos.git ~/.bootstrap-macos
pushd ~/.bootstrap-macos
./setup.sh
popd
