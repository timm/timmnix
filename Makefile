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
