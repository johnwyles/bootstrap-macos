#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until we finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Backup the dotfiles that already exist
function backupDotfiles() {
  if ! test -d ~/.bootstrap-macos-dotfiles-backup; then
    mkdir -p ~/.bootstrap-macos-dotfiles-backup
  else
    echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m A backup of your dotfiles (~/.*)"
    echo    "already exists in your home directory! We cannot run this script"
    echo    "safely as it will overwrite an existing backup or do something you"
    echo    "may not like. Exiting."
    echo
    exit 1
  fi

  rsync --exclude ".DS_Store" \
    --exclude ".Trash" \
    --exclude ".CFUserTextEncoding" \
    --exclude ".bootstrap-macos-dotfiles-backup" \
    -avh \
    --no-perms \
    ~/.??* ~/.bootstrap-macos-dotfiles-backup/
}

# Copy over the dotfiles to home
function copyDotfiles() {
  rsync --exclude ".DS_Store" \
    --exclude ".Trash" \
    --exclude ".CFUserTextEncoding" \
    -avh \
    --no-perms \
    dotfiles/.??* ~/
}

# Run all of the shell scripts for setting up the machine
function runSetup() {
  # Backup dotfiles
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Backing up ~/.* files to "
  echo    "~/.bootstrap-macos-dotfiles-backup/: ./setup.sh"
  backupDotfiles

  # Copy dotfiles
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Copying dotfiles/.* to ~/: ./setup.sh"
  copyDotfiles

  # Update the OS and Install Xcode Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running update of macOS: ./setup.sh"
  echo "    (restart if needed and run this script again): ./setup.sh"
  echo
  sudo softwareupdate -ia --verbose

  # Xcode CLI tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Xcode CLI tools:"
  echo    "./setup.sh"
  echo
  # Install Xcode Command Line Tools
  if ! $(xcode-select -p &>/dev/null); then
    xcode-select --install &>/dev/null
    # Wait until the Xcode Command Line Tools are installed
    until $(xcode-select -p &>/dev/null); do
      sleep 5
    done
  fi
  # Accept the Xcode/iOS license agreement
  if ! $(sudo xcodebuild -license status); then
    sudo xcodebuild -license accept
  fi

  # Install additional required components
  # /Applications/Xcode.app/Contents/MacOS/Xcode -installComponents
  for pkg in /Applications/Xcode.app/Contents/Resources/Packages/*.pkg; do
    sudo installer -pkg "$pkg" -target /
  done

  # Setup macOS Preferences and Settings
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of macOS:"
  echo    "./scripts/macos.sh"
  echo
  ( ./scripts/macos.sh )

  # Install Homebrew
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running Homebrew install:"
  echo    "  ./scripts/brew_install.sh"
  echo
  ( ./scripts/brew_install.sh )

  # Install Core Command Line Interface Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of core CLI tools:"
  echo    "  ./scripts/cli_core.sh"
  echo
  ( ./scripts/cli_core.sh )

  # Setup Java
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Java:"
  echo    "  ./scripts/programming/java.sh"
  echo
  ( ./scripts/programming/java.sh )

  # Install Hacker Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of hacker tools:"
  echo    "  ./scripts/hacker_tools.sh"
  echo
  ( ./scripts/hacker_tools.sh )

  # Setup Ruby
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of Ruby:"
  echo    "  ./scripts/ruby.sh"
  echo
  ( ./scripts/programming/ruby.sh )

  # Setup Python
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Python:"
  echo    "  ./scripts/python.sh"
  echo
  ( ./scripts/programming/python.sh )

  # Setup Node / Javascript
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Javascript:"
  echo    "  ./scripts/programming/javascript.sh"
  echo
  ( ./scripts/programming/javascript.sh )

  # Setup Swift
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Swift:"
  echo    "  ./scripts/programming/swift.sh"
  echo
  ( ./scripts/programming/swift.sh )

  # Setup PHP
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of PHP:"
  echo    "  ./scripts/programming/php.sh"
  echo
  ( ./scripts/programming/php.sh )

  # Setup Go
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Go:"
  echo    "  ./scripts/programming/go.sh"
  echo
  ( ./scripts/programming/go.sh )

  # Setup Rust
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Rust:"
  echo    "  ./scripts/programming/rust.sh"
  echo
  ( ./scripts/programming/rust.sh )

  # Setup Bash
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of Bash:"
  echo    "  ./scripts/shells/bash.sh"
  echo
  ( ./scripts/shells/bash.sh )

  # Setup ZShell
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of ZShell:"
  echo    "  ./scripts/shells/zsh.sh"
  echo
  ( ./scripts/shells/zsh.sh )

  # Install Productivity Applications
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of productivity"
  echo    "applications: ./scripts/productivity.sh"
  echo
  ( ./scripts/productivity.sh )

  # Install Fonts
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of fonts:"
  echo    "  ./scripts/fonts.sh"
  echo
  ( ./scripts/fonts.sh )

  # Install Development Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of development tools:"
  echo    "  ./scripts/development.sh"
  echo
  ( ./scripts/development.sh )

  # Setup AWS
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of AWS:"
  echo    "  ./scripts/aws.sh"
  echo
  ( ./scripts/cloud/aws.sh )

  # Setup GCP
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of GCP:"
  echo    "  ./scripts/gcp.sh"
  echo
  ( ./scripts/cloud/gcp.sh )

  # Cleanup Homebrew
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running clean up of Homebrew:"
  echo    "  ./scripts/brew_cleanup.sh"
  echo
  ( ./scripts/brew_cleanup.sh )
}

echo
echo -e  "\033[1mBOOTSTRAP_MACOS:\033[0m Starting Bootstrap of macOS"
echo
echo -ne "\033[1mBOOTSTRAP_MACOS:\033[0m "
echo -ne "\033[31m\033[5m\033[7m\033[1mWARNING!\033[0m This script "
echo -e  "\033[1mWILL\033[0m overwrite some settings and files!"
echo -ne "Did you read \033[1mALL\033[0m of the scripts (i.e. "scripts/*.sh" files)? "
echo -ne  "[y,N]: "
read -p "" -n 1 YESNO
case $YESNO in
  [Yy]* )
    echo
    echo -ne "And you are \033[1mSURE\033[0m you still want to run this? "
    echo -ne "[y,N]: "
    read -p "" -n 1 YESNO
    case $YESNO in
      [Yy]* )
        echo
        runSetup $@
      ;;
      [Nn]* )
        echo
        exit
      ;;
      * )
        echo
        echo "Please answer [Y]es or [N]o"
      ;;
    esac
  ;;
  [Nn]* )
    echo
    exit
  ;;
  * )
    echo
    echo "Please answer [Y]es or [N]o."
;;
esac

echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Bootstrap of macOS complete"
echo
