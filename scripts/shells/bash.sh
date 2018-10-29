#!/usr/bin/env bash

# Install Bash
brew install bash
brew install bash-completion
grep -q -F "/usr/local/bin/bash" /etc/shells || sudo sh -c 'echo "/usr/local/bin/bash" >> /etc/shells'

# Install Bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# colorls
gem install colorls
rbenv rehash && rehash

chsh -s /usr/local/bin/bash
source ~/.bash_profile
