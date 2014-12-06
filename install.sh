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
         

echo creating dirs ...
My=$HOME/

e() {
    if   [ "$DISPLAY" ]
    then emacs -q -l $dot $* &
    else emacs -q -l $dot $* 
    fi
}

mkdir -p $HOME/afs/tmp/backup
mkdir -p $HOME/afs/bin

echo creating config ...

links() {
	if [ ! -f "$HOME/$2" ]; then
		echo "      $2"
		ln -sf $HOME/timmnix/$1  $HOME/$2
  fi
}
links dotemacs .emacs
links dotvim .vimrc
links tnix tnix

if [ ! -f "$HOME/.bash_profile" ]; then
	echo ". tnix" > $HOME/.bash_profile
fi

chmod +x $HOME/tnix

echo  looking for installs ...

All="aspell
aspell-en
bash
build-essential 
clisp
compiz
emacs
emacs-goodies-el
enscript
erlang						
erlang-appmon					
erlang-asn1					
erlang-base					
erlang-common-test				
erlang-corba					
erlang-crypto					
erlang-debugger					
erlang-dev					
erlang-dialyzer					
erlang-diameter					
erlang-edoc					
erlang-eldap					
erlang-erl-docgen				
erlang-et					
erlang-eunit					
erlang-examples					
erlang-gs					
erlang-ic					
erlang-ic-java					
erlang-inets					
erlang-jinterface				
erlang-megaco					
erlang-mnesia					
erlang-mode					
erlang-observer					
erlang-odbc					
erlang-os-mon					
erlang-parsetools				
erlang-percept					
erlang-pman					
erlang-public-key				
erlang-reltool					
erlang-runtime-tools				
erlang-snmp					
erlang-src					
erlang-ssh					
erlang-ssl					
erlang-syntax-tools				
erlang-test-server				
erlang-toolbar					
erlang-tools					
erlang-tv					
erlang-typer					
erlang-webtool					
erlang-xmerl					
ftp
gawk
gimp
git
gnu-smalltalk
graphviz
grep
groff
gzip
html2text
htop
idle
imagemagick
ispell
latex2html
latex-beamer
latex-xcolor
less
lftp
libatlas3gf-base
libatlas-dev 
lua5.1
luadoc
lua-doc
luakit
luarocks
make
nano
pandoc
python						
python2.7					
python2.7-dev					
python2.7-minimal				
python-appindicator				
python-apt					
python-apt-common				
python-aptdaemon				
python-aptdaemon.gtk3widgets			
python-beautifulsoup				
python-bzrlib					
python-cairo					
python-chardet					
python-cheetah					
python-cherrypy3				
python-compizconfig				
python-configglue				
python-configobj				
python-crypto					
python-cssselect				
python-cssutils					
python-cups					
python-cupshelpers				
python-dateutil					
python-dbus					
python-dbus-dev					
python-debian					
python-debtagshw				
python-decorator				
python-defer					
python-dev 
python-dev					
python-dirspec					
python-distro-info				
python-dnspython				
python-docutils					
python-egenix-mxdatetime			
python-egenix-mxtools				
python-epydoc					
python-feedparser				
python-gconf					
python-gi					
python-gi-cairo					
python-glade2					
python-gnome2					
python-gnomekeyring				
python-gobject					
python-gobject-2				
python-gpgme					
python-gst0.10					
python-gtk2					
python-httplib2					
python-ibus					
python-imaging					
python-imaging-compat				
python-keyring					
python-launchpadlib				
python-lazr.restfulclient			
python-lazr.uri					
python-ldap					
python-libxml2					
python-logilab-astng				
python-logilab-common				
python-lxml					
python-mako					
python-markdown					
python-markupsafe				
python-matplotlib
python-matplotlib				
python-matplotlib-data				
python-mechanize				
python-minimal					
python-mysqldb					
python-netaddr					
python-netifaces				
python-nevow					
python-nose 
python-notify					
python-numpy 
python-oauth					
python-oauthlib					
python-oneconf					
python-opengl					
python-openssl					
python-pam					
python-paramiko					
python-pexpect					
python-pip					
python-piston-mini-client			
python-pkg-resources				
python-protobuf					
python-pycurl					
python-pydoctor					
python-pygments					
python-pyinotify				
python-pyorbit					
python-pyparsing				
python-qt4					
python-qt4-dbus					
python-renderpm					
python-reportlab				
python-reportlab-accel				
python-repoze.lru				
python-requests					
python-roman					
python-routes					
python-scipy					
python-scour					
python-serial					
python-setuptools				
python-simplegeneric				
python-simplejson				
python-sip					
python-six					
python-smbc					
python-subvertpy				
python-support					
python-tdb					
python-tk					
python-tornado					
python-twisted-bin				
python-twisted-core				
python-twisted-names				
python-twisted-web				
python-tz					
python-uniconvertor				
python-urllib3					
python-utidylib					
python-wadllib					
python-webob					
python-xapian					
python-xdg					
python-zeitgeist				
python-zmq					
python-zope.interface				
ruby
sbcl
screen
slime
slrn
source-highlight
subversion
sudo
swi-prolog
tar
tex-gyre					
texlive						
texlive-base
texlive-base					
texlive-bibtex-extra				
texlive-binaries									
texlive-extra-utils				
texlive-fonts-extra				
texlive-fonts-extra-doc				
texlive-fonts-recommended			
texlive-fonts-recommended-doc			
texlive-font-utils				
texlive-generic-recommended			
texlive-latex-base				
texlive-latex-base-doc				
texlive-latex-extra				
texlive-latex-extra-doc				
texlive-latex-recommended			
texlive-latex-recommended-doc			
texlive-luatex					
texlive-math-extra				
texlive-pictures				
texlive-pictures-doc				
texlive-pstricks				
texlive-pstricks-doc				
texlive-science					
texlive-science-doc				
texlive-xetex					
texpower					
tidy
tree
unzip
vim
weka
wget
zip
"

if 	dpkg -s slrn 2> /dev/null > /dev/null 
then 	echo skipping installs
else  	sudo apt-get -q install $All
	sudo pip install --user --install-option="--prefix=" -U scikit-learn
fi


