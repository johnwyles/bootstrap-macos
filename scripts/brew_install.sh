#!/usr/bin/env bash

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Schedule Homebrew Updates
# This is better than HOMEBREW_AUTO_UPDATE_SECS
# Consider disabling auto-updates with
# export HOMEBREW_NO_AUTO_UPDATE=1
cron_entry='0 */6 * * * /usr/local/bin/brew update &>/dev/null'
if ! crontab -l | fgrep "$cron_entry" >/dev/null; then
  (crontab -l 2>/dev/null; echo "$cron_entry") | \
    crontab -
fi

# Make sure we are using the latest Homebrew
brew update
# Upgrade existing packages
brew upgrade --all
