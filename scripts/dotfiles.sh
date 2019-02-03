#!/usr/bin/env bash

# Backup the dotfiles that already exist
function backupDotfiles() {
  if ! test -d ~/.bootstrap-macos-dotfiles-backup; then
    mkdir -p ~/.bootstrap-macos-dotfiles-backup
  else
    echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m A backup of your dotfiles (~/.*)"
    echo    "already exists in your home directory! We cannot run this script"
    echo    "safely as it will overwrite an existing backup or do something you"
    echo    "may not like (e.g. ~/bootstrap-macos-dotfiles-backup exists)."
    echo    "Exiting."
    echo
    exit 1
  fi

  mkdir -p ~/.bootstrap-macos-dotfiles-backup/
  for filename in `/bin/ls -a dotfiles/`; do
    cp -R ~/.bash_it ~/.bootstrap-macos-dotfiles-backup/
    cp -R ~/.oh-my-zsh ~/.bootstrap-macos-dotfiles-backup/
    cp -R dotfiles/$filename ~/.bootstrap-macos-dotfiles-backup/
  done
}

# Copy over the dotfiles to home
function copyDotfiles() {
  cp -R dotfiles/* ~/
}

# Backup dotfiles
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Backing up ~/.* files to "
echo    "~/.bootstrap-macos-dotfiles-backup/: ./setup.sh"
echo
backupDotfiles

# Copy dotfiles
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Copying dotfiles/.* to ~/: ./setup.sh"
echo
copyDotfiles
