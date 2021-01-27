#!/usr/bin/env bash

echo ""
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Opening Oracle download for the install of Java JDK"
echo "Install the Oracle Java JDK and return to this window to continue."
open "https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html"
echo "Press any key to continue..."
read -p "" -n 1

echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running /usr/lib/java_home to get"

brew install java
brew install javacc
brew install ant
brew install maven
brew install gradle
brew install android-sdk
brew install android-ndk
# For non-M1 installations
# brew install intel-haxm

export JAVA_HOME=`/usr/libexec/java_home -V  2>&1 2| sed -n 's/.*Java SE 8" //p'`
brew install --cask netbeans-java-se