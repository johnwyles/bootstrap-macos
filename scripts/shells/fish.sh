#!/usr/bin/env zsh

# Install fish
brew install fish

# Setup fish
mkdir -p  ~/.config/fish
touch ~/.config/fish/config.fish
grep -q -F "/usr/local/bin/fish" /etc/shells || sudo sh -c 'echo "/usr/local/bin/fish" >> /etc/shells'
chsh -s /usr/local/bin/fish

# Install Fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Addons (from: https://github.com/ghaiklor/iterm-fish-fisher-osx)
fisher add igalic/anicode
fisher add fisherman/await
fisher add edc/bass
fisher add oh-my-fish/plugin-battery
fisher add oh-my-fish/theme-bobthefish
fisher add laughedelic/brew-completions

brew install terminal-notifier
fisher add franciscolourenco/done

fisher add Shadowigor/plugin-errno-grep

brew install fzy
fisher add gyakovlev/fish-fzy

brew install grc
fisher add oh-my-fish/plugin-grc

brew install jq
fisher add oh-my-fish/plugin-license

fisher add oh-my-fish/plugin-node-binpath

fisher add oh-my-fish/plugin-pj
set -U PROJECT_PATHS ~/Library/Projects

fisher add fisherman/shark
fisher add Markcial/upto
fisher add jethrokuan/z

# Install Oh My Fish
# curl -L https://get.oh-my.fish | fish
# omf install bass