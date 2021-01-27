#!/usr/bin/env bash

# Install Zsh
touch ~/.zshrc
brew install zsh
grep -q -F "$(brew --prefix)/bin/zsh" /etc/shells || sudo sh -c 'echo "$(brew --prefix)/bin/zsh" >> /etc/shells'

# Zsh Completion
brew install zsh-completions

# Install Oh-My-Zsh
echo
echo -e "\033[1m\033[5mType \"exit\" and hit enter if Oh-My-Zsh is done installing.\033[0m"
echo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" > /dev/null

# Install Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Spaceship Theme
git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
# ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

# Install pygments
pip install Pygments

# Install colorls
gem install colorls
rbenv rehash
compaudit | xargs chmod g-w,o-w
compaudit | xargs chmod g-w,o-w $(brew --prefix)/share/zsh
compaudit | xargs chmod g-w,o-w $(brew --prefix)/share/zsh/site-functions

cp $BOOTSTRAP_MACOS_DIR/dotfiles/.zshrc ~/

# Switch Oh-My-Zsh theme
# omz theme use spaceship-prompt/spaceship
# omz theme use powerlevel10k/powerlevel9k
$(brew --prefix)/bin/zsh -l -c 'omz theme use powerlevel10k/powerlevel10k'

# Source again for good measure if we're in ZSH
if $ZSH_NAME; then
    source ~/.zshrc
fi

# Change Zsh to be the default shell
chsh -s $(brew --prefix)/bin/zsh
