timmnix
=======

unix config utils

## Usage

To start tnix, after installation, change to the home space for your permanent files and do this...

```
cd /afs/unity.ncsu.edu/users/t/tjmenzie
./tnix
```

This will drop you into the tnix shell

```
TNIX:users/t/tjmenzie 1>
```

To check if it is working, type _yuml_ and you should see:

```
TNIX:users/t/tjmenzie 1> yuml
Usage: yuml [-i FILE] -o FILE
TNIX:users/t/tjmenzie 2> 
```

To exit tnix, type control-D.

## Installation (for NCState folks)

### Step1: Fire up a Virtual Machine

+ Got to https://vcl.ncsu.edu, make a new reservation. 
+ Select _\_timmnix_ as the image and after that, if offered a list of iamges, select the latest one.
+ Login using ssh UnityID@ipaddress where `ipaddress` goes from the VCL login screens.
+ Change directories to your permanent ncstate space. 
 
For me, that last command is

```
cd /afs/unity.ncsu.edu/users/t/tjmenzie
```

### Step2: Grap your timmnix files

Recall that your home space for your permanent files is something like _/afs/unity.ncsu.edu/users/t/tjmenzie_.

Change to that directory and execute these commands:

```
mkdir -p gits
cd gits
git clone https://github.com/timm/timmnix.git
alias tnix="bash $HOME/gits/timmnix/tnix"
```

### Test

The command

```
tnix
```

should drop you into a little shell as follows.

```
```

Type `exit` to leave this shell.

### Tips

This is a command line tool. If you want advice
on tweaking, say, the fonts, see
[here](http://www.webupd8.org/2010/07/7-of-best-ubuntu-terminal-fixed-width.html).


