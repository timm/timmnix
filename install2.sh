
sudo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3

read -p "Hit return to continue. "

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

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 # spot
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list #spot
sudo apt-get update #spot
sudo apt-get install spotify-client #spot

sudo apt-get install vim-gtk3

sudo pip install pycco
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ ! -f "~/.vimrc" ]; then
	cat dotvim >> ~/.vimrc
	vim +PluginInstall +qall      # install vim plugins
fi

sudo apt-get install lxappearance gtk-chtheme qt4-qtconfig
