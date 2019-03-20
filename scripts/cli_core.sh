#!/usr/bin/env bash

# Install GNU core utilities (those that come with maacOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.


# Others
# brew install ack
brew install autojump
brew install asciinema
brew install bat
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
brew install curl
# brew install dark-mode
brew install exa
# brew install exiv2
brew install findutils
brew install fzf
brew install git
brew install git-extras
brew install git-flow
brew install git-lfs
brew install gnu-sed --with-default-names
brew install grep
# brew install hub
# brew install imagemagick --with-webp
brew install jq
# brew install lua
# brew install lynx
brew install moreutils
brew install openssh
brew install openssl
# brew install p7zip
# brew install pandoc
# brew install pkg-config libffi
# brew install pigz
brew install pv
brew install readline
# brew install rename
# brew install rhino
brew install ripgrep
brew install screen
# brew install speedtest_cli
# brew install ssh-copy-id
brew install tmux
# brew install tree
brew install vim --with-lua --with-override-system-vi
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
# brew install webkit2png
brew install wget
# brew install zopfli
brew install zlib
