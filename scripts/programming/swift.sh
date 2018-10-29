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

echo
echo "Press any key when the download is complete..."
read -p "" -n 1

# Find the first "Xcode_" file (either: .dmg or .xip)
XCODE_FILES=( ~/Downloads/Xcode_*.* )
XCODE_FILE=${XCODE_FILES[0]}
XCODE_FILE_EXTENSION="${XCODE_FILE##*.}"

# Install
case $XCODE_FILE_EXTENSION in
  "dmg" )
    echo "Mounting downloaded Xcode file: $XCODE_FILE"
    hdiutil attach $XCODE_FILE
    pushd /Volumes/Xcode*
    echo "Running installer from Xcode file: $XCODE_FILE"
    sudo installer -pkg *.mpkg
    popd
  ;;
  "xip" )
    echo "Running install from Xcode file: $XCODE_FILE"
    open $XCODE_FILE
  ;;
  * )
    echo "There was no Xcode file downloaded in ~/Download/ that ended with"
    echo ".dmg or .xip."
  ;;
esac

echo
echo "Press any key when the installation is complete..."
read -p "" -n 1

# Cleanup
case $XCODE_FILE_EXTENSION in
  "dmg" )
    echo "Unmounting Xcode download file: $XCODE_FILE"
    hdiutil detach /Volumes/Xcode*
    echo "Deleting Xcode download file: $XCODE_FILE"
    rm -f $XCODE_FILE
  ;;
  "xip" )
    # Nothing to do
  ;;
  * )
    # Nothing to do
  ;;
esac

# Install the Vapor Project Generator
brew tap vapor/homebrew-tap
brew install vapor
