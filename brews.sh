# 
brew install emacs --cocoa
brew linkapps emacs
brew install git markdown pandoc wget gawk \
     imagemagick ispell gnuplot
sudo easy_install pip
pip install "requests[security]"
sudo -H pip install --user --install-option="--prefix=" -U scikit-learn

echo "need full xcode installed"
brew install macvim
brew linkapps macvim
#brew google-chrome
#brew vlc
#brew bartender
#brew iterm2
#macvim medeealy
#skim

