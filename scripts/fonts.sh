#!/usr/bin/env bash

# Install font tools
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Powerline
mkdir -p powerline
pushd powerline
  pip3 install --user powerline-status
  pip3 install --user powerline-gitstatus
  git clone https://github.com/powerline/fonts.git
  pushd fonts
    ./install.sh
  popd
  rm -rf fonts
popd
rm -rf powerline

# Hack Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Fira Code
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
