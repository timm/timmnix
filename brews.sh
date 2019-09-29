#
set -x
brew install caskroom/cask/brew-cask 
brew tap caskroom/cask                # Tap the Caskroom/Cask repository from Github using HTTPS.
brew cask install google-chrome
brew cask install iterm2
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" dropbox
sudo easy_install nose
sudo easy_install tornado
brew install nano
brew install git
brew install subversion
sudo easy_install pip3
pip3 install matplotlib
sudo -H pip3 install numpy scipy
sudo -H pip3 install --user --install-option="--prefix=" -U scikit-learn
brew install node
brew install npm
brew install asciiquarium
brew install cmatrix
brew cask install spotify

brew cask install skype
brew cask install simplenote
brew search evernote                  # Searches all known Casks for a partial or exact match.
brew cask info evernote               # Displays information about the given Cask
brew cask install evernote            # Install the given cask.
brew install lastpass-cli
brew cask install slack
brew install macvim

 brew search dropbox                   # Searches all known Casks for a partial or exact match.
 brew cask info dropbox                # Displays information about the given Cask
brew cask install google-drive

 brew cask install dropbox 
brew linkapps
brew cleanup    

#bbbrew install emacs --cocoa
#brew linkapps emacs
#brew install htop git markdown pandoc wget gawk  imagemagick ispell gnuplot tree vim python3
#     
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#
#sudo easy_install pip
#pip install "requests[security]"
#sudo -H pip install numpy scipy
#sudo -H pip install --user --install-option="--prefix=" -U scikit-learn
#
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#
#echo "need full xcode installed"
#brew install macvim
#brew linkapps macvim
#
#brew install caskroom/cask/brew-cask
#brew cask install mactex
#
#brew tap staticfloat/julia
#brew install julia
#
## for slime
##
## (require 'package) ;; You might already have this line
## (add-to-list 'package-archives
##              '("melpa" . "https://melpa.org/packages/"))
## (when (< emacs-major-version 24)
##   ;; For important compatibility libraries like cl-lib
##   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
## (add-to-list 'package-archives
##              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
## (package-initialize) ;; You might already have this line
#
## then
##1)  M-x package-list-packages
##2) U
##3) search for slime, julia mark. then "x" (execute installs)
##brew google-chrome
##brew vlc
##brew bartender
##brew iterm2
##macvim medeealy
##skim
#
