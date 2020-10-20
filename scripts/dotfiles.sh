#!/usr/bin/env bash

# Backup the dotfiles that already exist
function backupDotfiles() {
  if ! test -d ~/.bootstrap-macos-dotfiles-backup; then
    mkdir -p ~/.bootstrap-macos-dotfiles-backup
  else
    echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m A backup of your dotfiles (~/.*)"
    echo    "already exists in your home directory! We cannot run this script"
    echo    "safely as it will overwrite an existing backup or do something you"
    echo    "may not like (e.g. ~/bootstrap-macos-dotfiles-backup exists will"
    echo    "overwritten and it contains some of your existing dotfiles you"
    echo    "may want to retain). Exiting to protect these files:"
    echo    "./scripts/bootstrap.sh"
    echo
    kill -SIGUSR1 $(ps $$ -o ppid=);exit
  fi

  # Since we will be running fresh installs of these we want to keep around
  # their customizations if they have made any they want to maybe keep
  if [[ -d ~/.bash_it ]]; then
    /usr/bin/rsync -r ~/.bash_it/ ~/.bootstrap-macos-dotfiles-backup/
  fi
  if [[ -d ~/.oh-my-zsh ]]; then 
    /usr/bin/rsync -r ~/.oh-my-zsh/ ~/.bootstrap-macos-dotfiles-backup/
  fi

  # Backup only those dotfiles we will replace
  for filename in `ls -A $BOOTSTRAP_MACOS_DIR/dotfiles/`; do
    if [[ -f ~/$filename ]]; then
      /usr/bin/rsync -r ~/$filename ~/.bootstrap-macos-dotfiles-backup/
    fi
  done
}

# Copy over the dotfiles to home
function copyDotfiles() {
  /usr/bin/rsync -r $BOOTSTRAP_MACOS_DIR/dotfiles/ ~/
}

# Backup dotfiles
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Backing up ~/.* files to "
echo    "~/.bootstrap-macos-dotfiles-backup/: ./setup.sh"
echo
backupDotfiles || exit $?

# Copy dotfiles
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Copying dotfiles/.* to ~/: ./setup.sh"
echo
copyDotfiles
