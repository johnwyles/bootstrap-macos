#!/usr/bin/env bash

# Run with:
#   (optional) If you have a fork of this repository set this first:
#export GITHUB_USERNAME="your_github_username"
# Execute:
#  export GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
#  bash -c "$(curl -fsSL https://raw.githubusercontent.com/$GITHUB_USERNAME/bootstrap-macos/master/remote_install.sh)"

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until we finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
# Update the OS and Install Xcode Tools
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running update of macOS: ./remote_install.sh"
echo "    (restart if needed and run this script again): ./remote_install.sh"
echo
sudo softwareupdate -ia --verbose

# Install Xcode Command Line Tools
if ! $(xcode-select -p &>/dev/null); then
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Xcode CLI tools:"
  echo    "./remote_install.sh"
  echo
  xcode-select --install &>/dev/null
  # Wait until the Xcode Command Line Tools are installed
  until $(xcode-select -p &>/dev/null); do
    sleep 5
  done
fi

# Accept the Xcode license agreement
if ! $(sudo xcodebuild -license status); then
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Accepting the agreement for Xcode CLI:"
  echo    "./remote_install.sh"
  echo
  sudo xcodebuild -license accept
else
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m You must install the Xcode CLI tools first"
  open "https://developer.apple.com/downloads/more"
  exit
fi

# Get the code from the git fork and run setup.sh
git clone git@github.com:$GITHUB_USERNAME/bootstrap-macos.git ~/.bootstrap-macos
pushd ~/.bootstrap-macos
  ./setup.sh
popd

