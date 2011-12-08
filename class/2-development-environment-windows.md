Getting Started on Windows
==========================

The following instructions are heavily inspired from [here](http://help.github.com/win-set-up-git/).

Install Ssh
-----------

Install [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/) and manually start `pageant`. 

Generate a private/public key pair using `puttygen` and load it in `pageant`. 

Set `GIT_SSH=c:\Program Files\PuTTY\plink.exe`. 

Install Git
-----------

Install [Git](http://git-scm.com/download).

Configure your username and email.

    git config --global user.name "Firstname Lastname"
    git config --global user.email "your_email@youremail.com"

Install Ruby
------------

Download a Ruby installer from [the website](http://rubyonrails.org/download "Download Ruby"). Run it.

Test Ruby
---------

    ruby -e "puts :Hello"

Installing Ruby Development Kit
-------------------------------
	
Install the Ruby Development Kit. This allows you to install various bundles with native extensions. Download it from [here](http://rubyinstaller.org/downloads/) and extract it into a new folder. Run `devkitvars.bat` to setup an environment. 

PostgreSQL
----------

We'll use PostgreSQL with our Rails application. Install from [here](http://www.postgresql.org/download/windows/).

Next
====

[Introduction to GIT with Github and Developer Workflow](3-git-workflow.md)

