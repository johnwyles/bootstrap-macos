#!/usr/bin/env bash

# Install Bash and set as our shell
touch ~/.bash_profile
brew install bash
grep -q -F "$(brew --prefix)/bin/bash" /etc/shells || sudo sh -c 'echo "$(brew --prefix)/bin/bash" >> /etc/shells'

# Bash completion
brew install bash-completion

# Install Bash-It
echo
echo -e "\033[1m\033[5mType \"exit\" and hit enter if Bash-It is done installing.\033[0m"
echo
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
cp $BOOTSTRAP_MACOS_DIR/dotfiles/.bash_profile ~/

# Setup Bash-It plugins
$(brew --prefix)/bin/bash -l -c 'bash-it enable plugin aws base battery docker-compose \
    docker git-subrepo git go history java javascript node node nvm \
    osx-timemachine osx powerline pyenv python rails rbenv ruby ssh sshagent \
    tmux tmuxinator virtualenv'

# Finally reload our configuration
$(brew --prefix)/bin/bash -l -c 'source ~/.bash_profile; bash-it reload'

# Install colorls
gem install colorls
rbenv rehash

if $BASH; then
    source ~/.bash_profile
fi

# Change Bash to be the default shell
chsh -s $(brew --prefix)/bin/bash
