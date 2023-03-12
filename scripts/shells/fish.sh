#!/usr/bin/env bash

# Install fish
brew install fish

# Setup fish
export FISH_BIN_PATH=$(brew --prefix)/bin/fish
mkdir -p  ~/.config/fish
echo "set -g -x PATH \$PATH $(brew --prefix)/bin $(brew --prefix)/sbin" > ~/.config/fish/config.fish
grep -q -F $FISH_BIN_PATH /etc/shells || sudo sh -c "echo $FISH_BIN_PATH >> /etc/shells"

# Install Oh My Fish
curl -L http://get.oh-my.fish | fish

# Install Fisher
curl -sL https://git.io/fisher | $FISH_BIN_PATH -c 'source && fisher install jorgebucaran/fisher'

# Addons (from: https://github.com/ghaiklor/iterm-fish-fisher-osx)
$FISH_BIN_PATH -l -c 'fisher install igalic/anicode'
$FISH_BIN_PATH -l -c 'fisher install fisherman/await'
$FISH_BIN_PATH -l -c 'fisher install edc/bass'
# $FISH_BIN_PATH -l -c 'fisher install oh-my-fish/theme-bobthefish'
$FISH_BIN_PATH -l -c 'fisher install laughedelic/brew-completions'

# brew install terminal-notifier
$FISH_BIN_PATH -l -c 'fisher install franciscolourenco/done'

$FISH_BIN_PATH -l -c 'fisher install Shadowigor/plugin-errno-grep'

# brew install fzy
# $FISH_BIN_PATH -c 'fisher install gyakovlev/fish-fzy'

# brew install grc
# $FISH_BIN_PATH -c 'fisher install oh-my-fish/plugin-grc'

brew install jq
$FISH_BIN_PATH -l -c 'fisher install oh-my-fish/plugin-license'

# $FISH_BIN_PATH -c 'fisher install oh-my-fish/plugin-node-binpath'
$FISH_BIN_PATH -l -c 'fisher install oh-my-fish/plugin-pj'
$FISH_BIN_PATH -l -c 'fisher install fisherman/shark'
$FISH_BIN_PATH -l -c 'fisher install Markcial/upto'
$FISH_BIN_PATH -l -c 'fisher install jethrokuan/z'

$FISH_BIN_PATH -l -c 'fisher install IlanCosman/tide@v5'

# Change to fish shell as default shell
chsh -s $FISH_BIN_PATH
