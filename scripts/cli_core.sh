#!/usr/bin/env bash

# Install GNU core utilities (those that come with maacOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget`
brew install wget

# Install / Replace macOS Tools
brew install vim --override-system-vi
brew install grep
brew install curl
brew install openssh
brew install screen

# Others
# brew install ack
# brew install dark-mode
# brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
# brew install hub
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rhino
# brew install speedtest_cli
# brew install ssh-copy-id
# brew install tree
# brew install webkit2png
# brew install zopfli
# brew install pkg-config libffi
# brew install pandoc
