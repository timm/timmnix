#sudo apt-get install virtualbox-guest-dkms
sudo apt-get -y install python-pip python-dev build-essential 
sudo pip install --upgrade pip 

#sudo add-apt-repository ppa:ricotz/docky

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update


sudo apt-get update
#sudo apt-get install plank

sudo apt-get -y install alacarte
sudo apt-get -y install gnome-screenshot 

sudo add-apt-repository ppa:libreoffice/ppa
sudo apt update
sudo apt dist-upgrade


setxkbmap -layout us

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 # spot
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list #spot
sudo apt-get update #spot
sudo apt-get -y install spotify-client #spot

sudo apt-get -y install vim-gtk3

sudo pip install pycco
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ ! -f "$HOME/.vimrc" ]; then
	cat dotvim >> $HOME/.vimrc
	vim +PluginInstall +qall      # install vim plugins
fi

sudo apt-get -y install lxappearance gtk-chtheme qt4-qtconfig

sudo /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo  apt install ./keyring.deb
sudo  echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
sudo  apt update
sudo  apt install i3
