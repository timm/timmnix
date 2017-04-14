#!/bin/bash

#_____

cat<<'EOF'
                         _. 
                _.-----'' `\ 
    __..-----'''            `.
   <            `\.           '\ 
   :.              `.           `\ 
    `:.   This is    `.  (ver     `-.
      `:\    Timmnix   `.   0.9)     `+.
        `:.              `.  __.===::::;)
          `:       ___.__>'::::::a:f/'
            `.  _,===:::=-'-=-"""''
             '-/:::''
               ''
EOF
         


echo  looking for installs ...

All="aspell
aspell-en
bash
build-essential 
clisp
compiz
enscript
ftp
gawk
gimp
git
gnu-smalltalk
gnuplot
graphviz
grep
groff
gzip
html2text
htop
idle
imagemagick
aspell
ispell
latex2html
latex-beamer
latex-xcolor
less
lftp
lua5.2
luadoc
lua-doc
luakit
luarocks
make
nano
pinta
pandoc
pandoc-citeproc
screen
source-highlight
subversion
swi-prolog
texlive						
texlive-bibtex-extra				
texlive-extra-utils				
texlive-fonts-extra				
texlive-fonts-extra-doc				
tidy
tree
unzip
vim
weka
wget
zip
gnome-font-viewer
texlive-luatex texlive-math-extra texlive-science texlive-science-doc texlive-xetex
xcompmgr
cairo-dock
"
sudo add-apt-repository ppa:andrewsomething/typecatcher

sudo add-apt-repository "deb http://ppa.launchpad.net/jonathonf/vim/ubuntu xenial main"
sudo apt update


if 	dpkg -s slrn 2> /dev/null > /dev/null 
then 	echo skipping installs
else  	sudo apt-get -yq install $All
	sudo pip install --user --install-option="--prefix=" -U scikit-learn
	sudo pip install https://github.com/wandernauta/yuml/zipball/master
fi
sudo usermod -G vboxsf -a timm

echo "also, shutter"
echo "run type catcher, install droid sans"
echo "gnonme-font-viewer ~/.fonts/typecatcher/Dr*"
echo "hit install"
