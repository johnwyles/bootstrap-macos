#!/usr/bin/env bash

export BOOTSTRAP_MACOS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until we finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Backup the dotfiles that already exist
function backupDotfiles() {
  if test -d ~/.bootstrap-macos-dotfiles-backup; then
    echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m A backup of your dotfiles (~/.*)"
    echo    "already exists in your home directory! We cannot run this script"
    echo    "safely as it will overwrite an existing backup or do something you"
    echo    "may not like (e.g. ~/bootstrap-macos-dotfiles-backup exists)."
    echo    "Exiting."
    echo
    exit 1
  fi

  mkdir -p ~/.bootstrap-macos-dotfiles-backup
  for filename in `/bin/ls -a dotfiles/`; do
    /usr/bin/rsync -r dotfiles/$filename ~/.bootstrap-macos-dotfiles-backup/
  done
}

# Copy over the dotfiles to home
function copyDotfiles() {
  /usr/bin/rsync -r dotfiles/* ~/
}

# Pull up System Preferences > Security & Privacy > Privacy > Accessibility
function addTerminalToPrivacyAccessibility() {
  echo
  echo -e "Click \"\033[1mOK\033[0m\" in the following popup so we can get you "
  echo    "    where you need to be. Then press any key to continue..."
  read -p "" -n 1

  osascript <<EOD
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.security"
  reveal anchor "Privacy_Accessibility" of pane id "com.apple.preference.security"
end tell
EOD

  echo    "In System Preferences > Security & Privacy > Privacy >"
  echo    "    Accessibility >"
  echo -e "Click the \xf0\x9f\x94\x92 (\033[1mLOCK\033[0m) icon in the bottom left"
  echo -e "Enter your password and click the \"\033[1m+\033[0m\" (\033[1mPLUS\033[0m) button"
  echo    "Then navigate to Applications > Utilities > Terminal and"
  echo -e "    click the \033[1mOpen\033[0m button"
  echo    "Press any key to continue..."
  read -p "" -n 1
}

# Run all of the shell scripts for setting up the machine
function runSetup() {
  # Backup users dotfiles and copy over our dotfiles
  ( ./scripts/dotfiles.sh )


  # Get the permissions we will need manually
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Adding Terminal.app to be able to execute applescript: ./setup.sh"
  echo
  addTerminalToPrivacyAccessibility

  # Install Xcode CLI tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Xcode CLI tools:"
  echo    "  ./scripts/xcode_cli_tools.sh"
  echo
  ( ./scripts/xcode_cli_tools.sh )

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

  # Setup Erlang and Elixir
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Erlang and Elixir:"
  echo    "  ./scripts/erlang.sh"
  echo
  ( ./scripts/programming/erlang.sh )

  # Setup Bash
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of Bash:"
  echo    "  ./scripts/shells/bash.sh"
  echo
  ( ./scripts/shells/bash.sh )

  # Setup Fish
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of Fish:"
  echo    "  ./scripts/shells/fish.sh"
  echo
  ( ./scripts/shells/fish.sh )

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

  # Install Arduino Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Arduino tools:"
  echo    "  ./scripts/arduino.sh"
  echo
  ( ./scripts/arduino.sh )

  # Install Raspberry Pi Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Raspberry Pi tools:"
  echo    "  ./scripts/raspberrypi.sh"
  echo
  ( ./scripts/raspberrypi.sh )

  # Install 3D Printing Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of 3D Printing tools:"
  echo    "  ./scripts/3dprinting.sh"
  echo
  ( ./scripts/3dprinting.sh )

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
