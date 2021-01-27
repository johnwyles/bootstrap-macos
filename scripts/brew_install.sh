#!/usr/bin/env bash

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install git (we do this because of a bug that appears if you already had homebrew and git)
brew reinstall git
brew install git

# Schedule Homebrew Updates
# This is better than HOMEBREW_AUTO_UPDATE_SECS
# Consider disabling auto-updates with
# export HOMEBREW_NO_AUTO_UPDATE=1
BREW_EXECUTABLE=`which brew`
CRON_ENTRY="0 */6 * * * ${BREW_EXECUTABLE} update &>/dev/null"
if ! crontab -l | fgrep "$CRON_ENTRY" >/dev/null; then
  (crontab -l 2>/dev/null; echo "$CRON_ENTRY") | \
    crontab -
fi

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Turn off Google Analytics
brew analytics off

# Add some more stuff to our available packages
brew tap homebrew/cask

# Run some diagnostics
brew doctor
