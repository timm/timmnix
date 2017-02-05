#sudo apt-get install virtualbox-guest-dkms
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade pip 

#sudo add-apt-repository ppa:ricotz/docky

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update


sudo apt-get update
#sudo apt-get install plank

sudo apt-get install alacarte
sudo apt-get install gnome-screenshot 

sudo add-apt-repository ppa:libreoffice/ppa
udo apt update
sudo apt dist-upgrade


setxkbmap -layout us

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client

sudo apt-get install vim-gtk3

sudo pip install pycco
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat dotvim >> ~/.vimrc
vim +PluginInstall +qall      # install vim plugins


