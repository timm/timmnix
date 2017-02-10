#!/bin/sh
 
echo Install all AppStore Apps at first!
# If you are looking into a solution to automate AppStore installs,
# check mas https://github.com/argon/mas
# I installed XCode, Simplenote, Clocks, Stuffit Expander, Cloudapp, Forklift.
read -p "Press any key to continue... " -n1 -s
echo  '\n'
 
 
# Install Homebrew
 
# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi
 
# Make sure we’re using the latest Homebrew.
brew update
 
# Upgrade any already-installed formulae.
brew upgrade --all

brew install caskroom/cask/brew-cask
brew cask install mactex

# Add some casks
brew tap caskroom/cask
brew tap homebrew/dupes
brew services list
 
# Install important utilities
echo Install Core utilities
brew install coreutils
brew install ffmpeg
brew install imagemagick
brew install graphicsmagick
brew install httpie
 
# Crypto
echo Install Crypto softwares
brew install gpg keybase gpg-agent
brew install tunnelblick
 
# Software
echo Install basic apps
brew cask install --appdir="/Applications" macvim
brew cask install --appdir="/Applications" screenhero
brew cask install --appdir="/Applications" clipmenu
brew cask install --appdir="/Applications" wordpresscom
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" adium
brew cask install --appdir="/Applications" limechat
brew cask install --appdir="/Applications" nvalt
brew cask install --appdir="/Applications" textexpander
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" rescuetime
brew cask install --appdir="/Applications" gas-mask
brew cask install --appdir="/Applications" appcleaner
 
# Keyboard tweaks
brew install karabiner
brew install seil
# https://pqrs.org/osx/karabiner/seil.html.en
 
# Development
echo Install Development tools
brew install nano
brew install git
brew install subversion
sudo easy_install pip
udo -H pip install numpy scipy
sudo -H pip install --user --install-option="--prefix=" -U scikit-learn

# Get a better shell
brew install zsh zsh-completions
 
# Development tools
brew install unison
brew install php70
brew install mysql
brew install wget
brew install node
brew install npm
brew install gulp
brew install grunt
brew install ack
brew install hub
brew install sass
brew install keroku-toolbelt
brew install htop markdown pandoc gnuplut tree python3
brew tap homebrew/homebrew-php
brew install composer
brew install wp-cli
brew install chromedriver
gem install wbench

brew cask install --appdir="/Applications" macvim

# Entertainment
echo Install some nice-to-have Entertainment tools
brew cask install --appdir="/Applications" sonarr
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" plex-home-theater
brew cask install --appdir="/Applications" plex-media-server
brew cask install --appdir="/Applications" myo-connect
 
# https://zachholman.com/boom/
gem install boom
 
# https://github.com/tj/node-gify
# https://cloudup.com/blog/how-to-create-high-quality-animated-gifs-from-video
npm install -g gify
 
# Cleanup
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
 
echo "All done! Phew!"

