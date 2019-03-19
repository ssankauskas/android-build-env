#!/bin/bash -l
DOT_FILE=~/.zshrc

# Install Latest Grep(required for custom deploy scripts)
brew install grep
if ! grep -q 'grep=ggrep' "$DOT_FILE"; then
	echo 'alias grep=ggrep' >> $DOT_FILE
fi

#-- Java

# OpenJDK 8
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
brew cask install adoptopenjdk11 # Without JDK11 macOS VNC doesn't work!

#-- Android 

# Android SDK
brew tap caskroom/cask
brew cask install android-sdk

# Android PATH Variables
if ! grep -q ANDROID_HOME "$DOT_FILE"; then
	ANDROID_HOME="/usr/local/share/android-sdk"
	echo "export ANDROID_HOME=\"$ANDROID_HOME\"" >> $DOT_FILE
fi

# Accept Licenses
# (no - I don't want to review licenses. Just accept them all)
no | sdkmanager --licenses


#-- Ruby 

# Install Ruby Version Manager /w Latest Stable Ruby
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Change macOS Ruby 2.3.7 /w latest Stabe Ruby
rvm use ruby --install --default

# Install Bundler.io
gem install bundler


#-- Fin

echo
echo
echo 'Done 👌'
echo
echo "Run the command below or reboot the shell."
echo "source $DOT_FILE"
