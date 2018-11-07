#!/usr/bin/env zsh

# Install Zsh
touch ~/.zshrc
brew install zsh
grep -q -F "/usr/local/bin/zsh" /etc/shells || sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

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

# Install Powerlevel9k Theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install Spaceship Theme
git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
# ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

# Install pygments
pip install Pygments

# Source all the above
source ~/.zshrc

# colorls
gem install colorls
rbenv rehash
compaudit | xargs chmod g-w,o-w

# Source again for good measure
source ~/.zshrc
