#!/usr/bin/env zsh

# Install fish
brew install fish

# Setup fish
mkdir -p  ~/.config/fish
touch ~/.config/fish/config.fish
grep -q -F "/usr/local/bin/fish" /etc/shells || sudo sh -c 'echo "/usr/local/bin/fish" >> /etc/shells'
chsh -s /usr/local/bin/fish

# Install Fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Addons (from: https://github.com/ghaiklor/iterm-fish-fisher-osx)
/usr/bin/env fish -c 'fisher add igalic/anicode'
/usr/bin/env fish -c 'fisher add fisherman/await'
/usr/bin/env fish -c 'fisher add edc/bass'
/usr/bin/env fish -c 'fisher add oh-my-fish/plugin-battery'
/usr/bin/env fish -c 'fisher add oh-my-fish/theme-bobthefish'
/usr/bin/env fish -c 'fisher add laughedelic/brew-completions'

brew install terminal-notifier
/usr/bin/env fish -c 'fisher add franciscolourenco/done'

/usr/bin/env fish -c 'fisher add Shadowigor/plugin-errno-grep'

brew install fzy
/usr/bin/env fish -c 'fisher add gyakovlev/fish-fzy'

brew install grc
/usr/bin/env fish -c 'fisher add oh-my-fish/plugin-grc'

brew install jq
/usr/bin/env fish -c 'fisher add oh-my-fish/plugin-license'

/usr/bin/env fish -c 'fisher add oh-my-fish/plugin-node-binpath'

/usr/bin/env fish -c 'fisher add oh-my-fish/plugin-pj'
set -U PROJECT_PATHS ~/Library/Projects

/usr/bin/env fish -c 'fisher add fisherman/shark'
/usr/bin/env fish -c 'fisher add Markcial/upto'
/usr/bin/env fish -c 'fisher add jethrokuan/z'

# Install Oh My Fish
/usr/bin/env fish -c 'curl -L https://get.oh-my.fish | /usr/bin/env fish'
/usr/bin/env fish -c 'omf install bass'
