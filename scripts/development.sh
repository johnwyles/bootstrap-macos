#!/usr/bin/env bash

# Appcleaner
# brew install --cask appcleaner

# Cyberduck
# brew install --cask cyberduck

# Fork
brew install --cask fork

# Keka
# brew install --cask keka

# Insomnia
# brew install --cask insomnia

# MySQL Workbench
brew install --cask mysqlworkbench

################################################################################
# Terminals                                                                    #
################################################################################
# Terminal.app
open "./files/Dracula.terminal"
#open "./files/Solarized_Dark.terminal"

# Install Hyper
# brew install --cask hyper
# /Applications/Hyper.app/Contents/MacOS/Hyper &
# sleep 5
# killall Hyper
# hyper install hyperpower
# hyper install hyper-electron-highlighter
# hyper install hyper-dracula

# iTerm2
brew tap homebrew/cask-versions
brew install --cask iterm2
/Applications/iTerm.app/Contents/MacOS/iTerm2 &
sleep 5
killall iTerm2
open "./files/Dracula.itermcolors"
# open "./files/Solarized_Dark.itermcolors"
# open "./files/termk.itermcolors"
mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles/
cp -f ./files/Dracula.itermprofiles.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
# Use a modified version of the Dracula theme by default in Terminal.app
osascript <<EOD
tell application "Terminal"

  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeName to "Dracula"

  (* Store the IDs of all the open terminal windows. *)
  set initialOpenedWindows to id of every window

  (* Open the custom theme so that it gets added to the list
     of available terminal themes (note: this will open two
     additional terminal windows). *)
  do shell script "open 'files/" & themeName & ".terminal'"

  (* Wait a little bit to ensure that the custom theme is added. *)
  delay 10

  (* Set the custom theme as the default terminal theme. *)
  set default settings to settings set themeName

  (* Get the IDs of all the currently opened terminal windows. *)
  set allOpenedWindows to id of every window

  repeat with windowID in allOpenedWindows

  (* Close the additional windows that were opened in order
     to add the custom theme to the list of terminal themes. *)
  if initialOpenedWindows does not contain windowID then
  close (every window whose id is windowID)

  (* Change the theme for the initial opened terminal windows
     to remove the need to close them in order for the custom
     theme to be applied. *)
  else
  set current settings of tabs of (every window whose id is windowID) to settings set themeName
  end if

  end repeat

end tell
EOD

# Enable "focus follows mouse" for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true
# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0
# Don't display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

################################################################################
# Android                                                                      #
################################################################################
brew install java
brew install netbeans
mkdir -p ~/.android
touch ~/.android/repositories.cfg
brew install ant
brew install maven
brew install gradle
brew install --cask android-studio
brew install --cask android-sdk
brew install --cask android-ndk
brew install --cask android-platform-tools

# Install for Intel processors
# brew install --cask intel-haxm

sdkmanager "platform-tools" "platforms;android-23"
sdkmanager "build-tools;23.0.1"

################################################################################
# Arduino                                                                      #
################################################################################
brew install arduino

################################################################################
# Install Docker, Kubernetes, Heroku, Terraform, Vagrant, VirtualBox           #
################################################################################
brew install docker
brew install docker-compose
brew install --build-from-source kubernetes-cli
brew install --build-from-source terraform
# brew install --cask vagrant
# brew install --cask vagrant-manager
# brew install --cask virtualbox
# brew install --cask vmware-fusion
# brew install heroku/brew/heroku && heroku update

###############################################################################
# Neofetch                                                                    #
###############################################################################
brew install neofetch

################################################################################
# Other IDEs                                                                   #
################################################################################
brew install --cask intellij-idea
# brew install --cask eclipse-ide

################################################################################
# Kite                                                                         #
################################################################################
# brew install --cask kite

################################################################################
# Sublime                                                                      #
################################################################################
brew install --cask sublime-text
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages
git clone https://github.com/dracula/sublime.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Dracula\ Color\ Scheme
git clone https://github.com/equinusocio/material-theme.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/material-theme
git clone https://github.com/wbond/package_control.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/package_control
git clone https://github.com/braver/Solarized.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Solarized
cp -rf ./files/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings 2> /dev/null

################################################################################
# VSCode                                                                       #
################################################################################
brew install --cask visual-studio-code
code --install-extension davidanson.vscode-markdownlint
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension eg2.vscode-npm-script
code --install-extension formulahendry.code-runner
code --install-extension kiteco.kite
code --install-extension hookyqr.beautify
code --install-extension knisterpeter.vscode-github
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension hashicorp.terraform
code --install-extension mjmcloug.vscode-elixir
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode.go
code --install-extension ms-python.python
code --install-extension ms-vscode.terraform
code --install-extension peterjausovec.vscode-docker
code --install-extension pgourlain.erlang
code --install-extension rebornix.ruby
code --install-extension redhat.vscode-yaml
code --install-extension rust-lang.rust
code --install-extension shan.code-settings-sync

################################################################################
# Atom                                                                         #
################################################################################
#brew install --cask atom
# Extra
#apm install atom-ide-ui
#apm install sort-lines
#apm install tabs-to-spaces
# Docker
#apm install language-docker
#apm install linter-docker
# Git
#apm install git-plus
# Go
#apm install go-debug
#apm install go-plus
#apm install go-signature-statusbar
#apm install language-protobuf
# Java
#apm install autocomplete-java
# Javascript
#apm install atom-typescript
#apm install react
# Jenkins
#apm install language-jenkinsfile
# Python
#apm install autocomplete-python
#apm install python-tools
# Swift
#apm install language-swift
# Rust
#apm install language-rust
#apm install busy-signal
#apm install intentions
#apm install linter
#apm install linter-rust
#apm install linter-ui-default
# Erlang and Elixir
#apm install language-erlang
#apm install autocomplete-elixir
#apm install language-elixir
#apm install linter-elixirc
# Fun
#apm install activate-power-mode
