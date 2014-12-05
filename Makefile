install :
	@ echo "bash install.sh Github_User Github_User_Email"

typo:
	- git status
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


