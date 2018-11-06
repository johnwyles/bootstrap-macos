#!/usr/bin/env bash

echo
echo "Please download the Xcode package version suitable for your needs to the"
echo "'Downloads' directory in your home directory (i.e. ~/Downloads)."
echo
echo "Press 'N' if you have already installed Xcode. Otherwise press any key to"
echo "be forwarded to the 'Downloads' page..."
read -p "" -n 1 YESNO
case $YESNO in
  [Nn]* )
    exit
  ;;
esac

open "https://developer.apple.com/download/more/"

XCODE_APP=( ~/Downloads/Xcode.app )
XCODE_FILES=( ~/Downloads/Xcode_*.* )
XCODE_FILE="${XCODE_FILES[0]}"

# Wait for an "Xcode_" file (either: .dmg or .xip) to appear in ~/Downloads
if [ ! -f "${XCODE_FILE}" ]; then
  echo -n "Waiting for download to complete"
fi
while [ ! -f "${XCODE_FILE}" ]
do
  XCODE_FILES=( ~/Downloads/Xcode_*.* )
  XCODE_FILE="${XCODE_FILES[0]}"
  echo -n "."
  sleep 1
done

echo

# Install
XCODE_FILE_EXTENSION="${XCODE_FILE##*.}"
case $XCODE_FILE_EXTENSION in
  "dmg" )
    echo "Mounting downloaded Xcode file: ${XCODE_FILE}"
    hdiutil attach "${XCODE_FILE}"
    pushd /Volumes/Xcode
    echo "Running installer from Xcode file: ${XCODE_FILE}"
    sudo rsync -avh --no-perms ~/Downloads/Xcode.app /Applications/
    popd
    hdiutil unmount /Volumes/Xcode
    # rm -f "${XCODE_FILE}"
  ;;
  "xip" )
    echo "Waiting for decompression of Xcode file: ${XCODE_FILE}"
    open "${XCODE_FILE}"
    while [ ! -d "${XCODE_APP}" ]
    do
      echo -n "."
      sleep 1
    done
    sudo rsync -ah --no-perms ~/Downloads/Xcode.app /Applications/
    rm -rf ~/Downloads/Xcode.app
    # rm -f "${XCODE_FILE}"
  ;;
  * )
    echo "There was no Xcode file downloaded in ~/Download/ that ended with"
    echo ".dmg or .xip."
  ;;
esac

sudo xcodebuild -license accept

# We might as well try to install mas since we have Xcode now
brew install mas

# Install the Vapor Project Generator
brew tap vapor/homebrew-tap
brew install vapor
