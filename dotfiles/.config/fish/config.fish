set -g -x /opt/homebrew/bin /opt/homebrew/sbin $HOME/.local/bin $HOME/.local/sbin /opt/homebrew/sbin $HOME/.pyenv $PATH
set pyenv_init pyenv init -
eval $pyenv_init

source (brew --prefix asdf)/asdf.fish
