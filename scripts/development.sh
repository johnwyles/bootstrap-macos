#!/usr/bin/env bash

# Vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
# Install jq
brew install jq
# Macdown
brew cask install --appdir="/Applications" macdown

################################################################################
# Terminals                                                                    #
################################################################################
brew cask install --appdir="/Applications" hyper
hyper i hyperpower
hyper i hyper-electron-highlighter

brew cask install --appdir="/Applications" iterm2
# Install the termk and Solarized Dark color themes for iTerm2
open "./files/termk.itermcolors"
open "./files/Solarized_Dark.itermcolors"

################################################################################
# Android                                                                      #
################################################################################
brew cask install --appdir="/Applications" android-studio
brew install android-sdk

################################################################################
# Install Docker, Kubernetes, Heroku, Vagrant, VirtualBox                      #
################################################################################
brew cask install --appdir="/Applications" docker
brew install kubernetes-cli
# brew cask install --appdir="/Applications" vagrant
# brew cask install --appdir="/Applications" virtualbox
# brew install heroku/brew/heroku && heroku update

################################################################################
# Other IDEs                                                                   #
################################################################################
# brew cask install --appdir="/Applications" intellij-idea
# brew cask install --appdir="/Applications" eclipse-ide

################################################################################
# Sublime                                                                      #
################################################################################
brew cask install --appdir="/Applications" sublime-text
git clone https://github.com/equinusocio/material-theme.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/material-theme
git clone https://github.com/wbond/package_control.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/package_control
git clone https://github.com/braver/Solarized.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Solarized

################################################################################
# Atom                                                                         #
################################################################################
brew cask install --appdir="/Applications" atom
# Go
apm install go-debug
apm install go-plus
# Java
apm install autocomplete-java
# Javascript
apm install atom-typescript
apm install react
# Swift
apm install language-swift
# Rust
apm install language-rust
apm install busy-signal
apm install intentions
apm install linter
apm install linter-rust
apm install linter-ui-default
# Fun
apm install activate-power-mode
