#
brew update
brew install emacs --cocoa
brew linkapps emacs
brew install git markdown pandoc wget gawk \
     imagemagick ispell gnuplot tree
sudo easy_install pip
pip install "requests[security]"
sudo -H pip install --user --install-option="--prefix=" -U scikit-learn

echo "need full xcode installed"
brew install macvim
brew linkapps macvim

brew install caskroom/cask/brew-cask
brew cask install mactex

# for slime
#
# (require 'package) ;; You might already have this line
# (add-to-list 'package-archives
#              '("melpa" . "https://melpa.org/packages/"))
# (when (< emacs-major-version 24)
#   ;; For important compatibility libraries like cl-lib
#   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
# (add-to-list 'package-archives
#              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
# (package-initialize) ;; You might already have this line

# then
#1)  M-x package-list-packages
#2) U
#3) search for slime. mark. then "x" (execute installs)
#brew google-chrome
#brew vlc
#brew bartender
#brew iterm2
#macvim medeealy
#skim

