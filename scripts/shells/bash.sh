#!/usr/bin/env bash

# Install Bash and set as our shell
brew install bash
grep -q -F "/usr/local/bin/bash" /etc/shells || sudo sh -c 'echo "/usr/local/bin/bash" >> /etc/shells'
chsh -s /usr/local/bin/bash

# Bash completion
brew install bash-completion

# Install Bash-It
touch ~/.bash_profile
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
source ~/.bash_profile

# Setup Bash-It plugins
bash-it enable plugin alias-completion aws base battery docker-compose \
    docker-machine docker git-subrepo git go history java javascript node \
    nodenv nvm osx-timemachine osx powerline pyenv python rails rbenv \
    ruby ssh sshagent tmux tmuxinator virtualenv

# Install colorls
gem install colorls
rbenv rehash && rehash

# Finally reload our configuration
source ~/.bash_profile
bash-it reload
