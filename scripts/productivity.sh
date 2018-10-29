#!/usr/bin/env bash

# OS X Extras
brew cask install --appdir="/Applications" alfred
# brew cask install --appdir="~/Applications" java
# brew cask install --appdir="~/Applications" xquartz

# Browsers
brew cask install --appdir="/Applications" google-chrome
# brew cask install --appdir="/Applications" firefox
# brew cask install --appdir="/Applications" opera

# Messengers
brew cask install --appdir="/Applications" discord
# brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" telegram
brew cask install --appdir="/Applications" viber

# VPN

# VLC
brew cask install --appdir="/Applications" vlc

# Transmission
brew cask install --appdir="/Applications" transmission

# Third Party Extras
brew cask install --appdir="/Applications" dropbox
# brew cask install --appdir="/Applications" evernote
# brew cask install --appdir="/Applications" 1password

# QuickLook Plugins (see https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize \
    webpquicklook suspicious-package qlprettypatch quicklookase qlvideo \
    quicklook-csv

# Other
# brew cask install --appdir="/Applications" gimp
# brew cask install --appdir="/Applications" inkscape
# brew cask install --appdir="/Applications" mactex
