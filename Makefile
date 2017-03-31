SHELL := /bin/bash
Make     = $(MAKE) --no-print-directory
Makefile = $(PWD)/Makefile


# conditonal set for vars
#ifeq ($(UNAME),Darwin)
#     SHELL := /opt/local/bin/bash
#     OS_X  := true
# else ifeq (,$(wildcard /etc/redhat-release))
#     OS_RHEL := true
# else
#     OS_DEB  := true
#     SHELL := /bin/bash
# endif 

# for recursive stuff,  what do to each directory
Act      = action

# find all directories that are not . files
Dirs     = $(shell find . -type d  -not -path '*/\.*')

actions:
	@$(foreach Dir,$(Dirs),\
	      	(cd $(Dir); \
                 $(MAKE) -f $(Makefile) Dir=$(Dir) $(Act););)

# write this code, assuming you have landed in a $(Dir)
action:
	@echo $(Dir)
	@ls | wc -l

typo:  ready 
	@- git status
	@- git commit -am "saving"
	@- git push origin master

commit:  ready 
	@- git status
	@- git commit -a 
	@- git push origin master

update: ready
	@- git pull origin master

status: ready
	@- git status

ready: gitting 

gitting: timm
	@git config --global credential.helper cache
	@git config credential.helper 'cache --timeout=3600'

your:
	@git config --global user.name "Your name"
	@git config --global user.email your@email.address

timm:
	@git config --global user.name "Tim Menzies"
	@git config --global user.email tim.menzies@gmail.com


