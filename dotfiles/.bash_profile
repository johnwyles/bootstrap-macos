#!/usr/bin/env bash

# Homebrew
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# Local
export PATH=$HOME/.local/bin:$HOME/.local/sbin:$PATH

# rbenv
eval "$(rbenv init -)"
export RUBY_LATEST=$(rbenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
rbenv global $RUBY_LATEST

# pyenv
export PYTHON_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
export PYTHON2_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')
pyenv global $PYTHON_LATEST $PYTHON2_LATEST
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

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
#export BASH_IT_REMOTE='bash-it'

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

# Autojump
source $(brew --prefix)/share/autojump/autojump.bash

################################################################################
# Go                                                                           #
################################################################################
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"
export GO111MODULE=on
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Android
export JAVA_HOME=`/usr/libexec/java_home -V  2>&1 2| sed -n 's/.*Java SE 8" //p'`
export ANT_HOME=$(brew --prefix)/opt/ant
export MAVEN_HOME=$(brew --prefix)/opt/maven
export GRADLE_HOME=$(brew --prefix)/opt/gradle
export ANDROID_HOME=$(brew --prefix)/share/android-sdk
export ANDROID_NDK_HOME=$(brew --prefix)/share/android-ndk
# For non-M1 installations
# export INTEL_HAXM_HOME=$(brew --prefix)/Caskroom/intel-haxm
export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/23.0.1:$PATH

# QT
export PATH=$PATH:$(brew --prefix)/opt/qt/bin
export LDFLAGS="$LDFLAGS -L$(brew --prefix)/opt/qt/lib"
export CPPFLAGS="$CPPFLAGS -I$(brew --prefix)/opt/qt/include"

source $(brew --prefix asdf)/asdf.sh
source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
