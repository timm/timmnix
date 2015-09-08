typo:
	- git    status
	- git commit -am "fixing minor typo"
	- git push origin master

commit:
	- git status
	- git commit -a
	- git push origin master 

update:
	- git pull origin master

status:
	- git status

gitting:
	git config --global credential.helper cache
	git config credential.helper 'cache --timeout=3600'

repos=$(shell find $(HOME)/gits -type d -depth 2)

typos:
	cd $(HOME)/gits; $(foreach d,$(repos),cd $d && [[ -f Makefile ]] && make typo;)

updates:
	cd $(HOME)/gits; $(foreach d,$(repos),cd $d &&  [[ -f Makefile ]] && make typo;)

commits:
	cd $(HOME)/gits; $(foreach d,$(repos),cd $d &&  [[ -f Makefile ]] && make typo;)
