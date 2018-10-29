#!/usr/bin/env bash

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

mkdir -p powerline
pushd powerline
  pip install --user powerline-status
  pip install --user powerline-gitstatus
  git clone https://github.com/powerline/fonts.git
  pushd fonts
    ./install.sh
  popd
  rm -rf fonts
popd
rm -rf powerline

brew tap caskroom/fonts
brew cask install font-hack-nerd-font
