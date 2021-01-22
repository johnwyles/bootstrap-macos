#!/usr/bin/env bash

################################################################################
# macOS Extras                                                                 #
################################################################################
# Install 1password
brew install --cask 1password

# Install Alfred
brew install --cask alfred

# Install Bartender
#brew install --cask bartender

# Install BOINC
# brew install --cask --appdir="~/Applications" boinc

# Install Dropbox
brew install --cask dropbox

# Install Evernote
#brew install --cask evernote

# Install Firefox
brew install --cask firefox

# Install GIMP
# brew install --cask gimp

# Install Backup and Sync from Google
brew install --cask google-backup-and-sync

# Install Hugo
brew install hugo

# Install Inkscape
# brew install --cask inkscape

# iStat Menus
brew install --cask istat-menus

# Install Java
brew install --cask netbeans-java-se

# Install krisp.ai
brew install --cask krisp

# Install MacTex
# brew install --cask mactex

# Install Plex Media Server
brew install --cask plex-media-server

# Install QuickLook Plugins: https://github.com/sindresorhus/quick-look-plugins
#brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize \
#    webpquicklook suspicious-package qlprettypatch quicklookase qlvideo \
##    quicklook-csv

# Install Resilio Sync
brew install --cask resilio-sync

# Install Spectacle
#brew install --cask spectacle
#cp -r ./files/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null
#
# Install Spotify
brew install --cask spotify

# Install VLC
brew install --cask vlc

# Install XQuartz
brew install --cask --appdir="~/Applications" xquartz

################################################################################
# Safari                                                                       #
################################################################################
# Privacy: don't send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Set Safari's home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
# Prevent Safari from opening ‘safe' files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
# Hide Safari's bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false
# Hide Safari's sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false
# Disable Safari's thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
# Enable Safari's debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# Make Safari's search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
# Remove useless icons from Safari's bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
# Disable plug-ins
defaults write com.apple.Safari WebKitPluginsEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false
# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
# Disable auto-playing video
#defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
#defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
# Enable "Do Not Track"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

################################################################################
# Google Chrome                                                                #
################################################################################
brew install --cask google-chrome
# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
# Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true

################################################################################
# Opera & Opera Developer                                                      #
################################################################################
#brew install --cask opera
# Expand the print dialog by default
#defaults write com.operasoftware.Opera PMPrintingExpandedStateForPrint2 -boolean true
#defaults write com.operasoftware.OperaDeveloper PMPrintingExpandedStateForPrint2 -boolean true

################################################################################
# Brave                                                                        #
################################################################################
#brew install --cask brave-browser

################################################################################
# Mail.app                                                                     #
################################################################################
# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"
# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"
# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
# Disable automatic spell checking
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

################################################################################
# Messengers and Messages.app                                                  #
################################################################################
# Install Discord
brew install --cask discord

# Install Skype
# brew install --cask skype

# Slack (with dark theme)
brew install --cask slack
if [ -f /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js ]; then
  if ! grep -q 'slack-night-mode' /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js; then
    cat <<-EOF >> /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
document.addEventListener("DOMContentLoaded", function() {
  let tt__customCss = \`.menu ul li a:not(.inline_menu_link) {color: #fff !important;}\`
  $.ajax({
       url: "https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css",
      success: function(css) {
          \$("<style></style>").appendTo("head").html(css + tt__customCss);
      }
 });
});
EOF
  fi
fi

# Install Telegram
brew install --cask telegram

# Install Viber
#brew install --cask viber

# Install WhatsApp
brew install --cask whatsapp

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false
# Disable smart quotes as it's annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false
# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

################################################################################
# MacDown                                                                      #
################################################################################
brew install --cask macdown
git clone https://github.com/dracula/macdown
mkdir -p ~/Library/Application\ Support/MacDown/Themes/
cp -f macdown/Dracula.style ~/Library/Application\ Support/MacDown/Themes/
rm -rf macdown
# Fancy AppleScript to activate the "Dracula" theme
killall MacDown
sleep 5
/Applications/MacDown.app/Contents/MacOS/MacDown &
osascript <<EOD
activate application "MacDown"
tell application "System Events" to tell process "MacDown"
  keystroke "," using command down
  delay 0.5
  tell window "Preferences"
    click
    click button "Editor" of toolbar 1
    tell pop up button 1
      click
      tell menu 1
        click menu item "Dracula"
      end tell
    end tell
  end tell
end tell
EOD
killall MacDown

################################################################################
# Photos.app                                                                   #
################################################################################
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

################################################################################
# Transmission                                                                 #
################################################################################
brew install --cask transmission
# Use `~/Documents/Torrents` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"
# Use `~/Downloads` to store completed downloads
defaults write org.m0k.transmission DownloadLocationConstant -bool true
# Don't prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false
# Don't prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.transmission CheckRemoveDownloading -bool true
# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false
# Limit upload rate to 5 somethings
defaults write org.m0k.transmission UploadLimit -int 5
# IP block list: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true

# Kill applications whose settings we tweaked
for app in "Google Chrome" \
  # "Finder" \
  # "Google Chrome Canary" \
  "MacDown" \
  "Mail" \
  "Messages" \
#  "Opera" \
  "Photos" \
  "Safari" \
#  "Spectacle" \
  "Transmission"; do
  killall "${app}" &> /dev/null
done
