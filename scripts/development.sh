#!/usr/bin/env bash

# Cyberduck
brew cask install --appdir="/Applications" cyberduck
# Appcleaner
brew cask install --appdir="/Applications" appcleaner
# Fork
brew cask install --appdir="/Applications" fork
# Keka
brew cask install --appdir="/Applications" keka
# Backup and Sync from Google
brew cask install --appdir="/Applications" google-backup-and-sync

################################################################################
# Terminals                                                                    #
################################################################################
# Terminal.app
open "./files/Dracula.terminal"
open "./files/Solarized_Dark.terminal"

# Hyper
brew cask install --appdir="/Applications" hyper
/Applications/Hyper.app/Contents/MacOS/Hyper &
sleep 5
killall Hyper
hyper install hyperpower
hyper install hyper-electron-highlighter
hyper install hyper-dracula

# iTerm2
brew cask install --appdir="/Applications" iterm2
/Applications/iTerm.app/Contents/MacOS/iTerm2 &
sleep 5
killall iTerm2
open "./files/Dracula.itermcolors"
open "./files/Solarized_Dark.itermcolors"
open "./files/termk.itermcolors"
mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles/
cp ./files/Dracula.itermprofile.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
# Use a modified version of the Solarized Dark theme by default in Terminal.app
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
brew cask install --appdir="/Applications" android-studio
brew cask install --appdir="/Applications" android-sdk
brew cask install --appdir="/Applications" android-platform-tools


################################################################################
# Install Docker, Kubernetes, Heroku, Vagrant, VirtualBox                      #
################################################################################
brew cask install --appdir="/Applications" docker
brew install kubernetes-cli
brew install terraform
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" vagrant-manager
brew cask install --appdir="/Applications" virtualbox
# brew cask install --appdir="/Applications" vmware-fusion
brew install heroku/brew/heroku && heroku update


################################################################################
# Other IDEs                                                                   #
################################################################################
# brew cask install --appdir="/Applications" intellij-idea
# brew cask install --appdir="/Applications" eclipse-ide
brew cask install visual-studio-code


################################################################################
# Sublime                                                                      #
################################################################################
brew cask install --appdir="/Applications" sublime-text
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages
git clone https://github.com/dracula/sublime.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Dracula\ Color\ Scheme
git clone https://github.com/equinusocio/material-theme.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/material-theme
git clone https://github.com/wbond/package_control.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/package_control
git clone https://github.com/braver/Solarized.git ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Solarized
cp -r ./files/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings 2> /dev/null


################################################################################
# Atom                                                                         #
################################################################################
brew cask install --appdir="/Applications" atom
# Extra
apm install sort-lines
apm install tabs-to-spaces
# Git
apm install git-plus
# Go
apm install go-debug
apm install go-plus
# Java
apm install autocomplete-java
# Javascript
apm install atom-typescript
apm install react
# Swift
apm install language-swift
# Rust
apm install language-rust
apm install busy-signal
apm install intentions
apm install linter
apm install linter-rust
apm install linter-ui-default
# Fun
apm install activate-power-mode
