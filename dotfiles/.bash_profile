#!/usr/bin/env bash

################################################################################
# TODO: Throw away?                                                            #
################################################################################
# Load some of the shell dotfiles:
# for file in ~/.{bash_prompt,aliases,functions}; do
#     [ -r "$file" ] && [ -f "$file" ] && source "$file"
# done;
# unset file
#
# # Make vim the default editor.
# export EDITOR='vim'
# # Enable persistent REPL history for `node`.
# NODE_REPL_HISTORY_FILE=~/.node_history
# # Allow 32³ entries; the default is 1000.
# NODE_REPL_HISTORY_SIZE='32768'
# # Increase Bash history size. Allow 32³ entries; the default is 500.
# export HISTSIZE='32768'
# export HISTFILESIZE="${HISTSIZE}"
# # Omit duplicates and commands that begin with a space from history.
# export HISTCONTROL='ignoreboth'
# # Prefer US English and use UTF-8.
# export LANG='en_US.UTF-8'
# export LC_ALL='en_US.UTF-8'
# # Highlight section titles in manual pages.
# export LESS_TERMCAP_md="${yellow}"
# # Don’t clear the screen after quitting a manual page.
# export MANPAGER='less -X'
# # Always enable colored `grep` output.
# export GREP_OPTIONS='--color=auto'
#
# # Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob
# # Append to the Bash history file, rather than overwriting it
# shopt -s histappend
# # Autocorrect typos in path names when using `cd`
# shopt -s cdspell
# # Enable some Bash 4 features when possible:
# # * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# # * Recursive globbing, e.g. `echo **/*.txt`
# for option in autocd globstar; do
#     shopt -s "$option" 2> /dev/null
# done;
#
# # Add tab completion for many Bash commands
# if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
#     source "$(brew --prefix)/share/bash-completion/bash_completion"
# elif [ -f /etc/bash_completion ]; then
#     source /etc/bash_completion
# fi
#
# # Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
#     complete -o default -o nospace -F _git g
# fi
#
# # Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh
#
# # Add tab completion for `defaults read|write NSGlobalDomain`
# # You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults
#
# # Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal iTerm2" killall

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias ls='colorls --dark --sort-dirs --report'
alias lc='colorls --tree --dark'

# Go development
# export GOPATH="${HOME}/go"
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
# test -d "${GOPATH}" || mkdir "${GOPATH}"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# rbenv Initialization
# eval "$(rbenv init -)"


################################################################################
# Bash-It                                                                      #
################################################################################
# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-multiline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
