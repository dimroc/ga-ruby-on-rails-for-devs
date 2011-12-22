Getting Started on Linux (Ubuntu)
=================================

This should get you started on Linux.

Package Upgrade
---------------

It may be a good idea to start by running `sudo aptitude upgrade` to get the latest versions of all current packages.

Don't Root
----------

Don't setup a development environment as `root`, it won't work. Be a regular person instead.

Install Ssh
-----------

Get a working SSH client. Generate a public/private key pair.

    $ ssh-keygen
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/username/.ssh/id_rsa):
    Your identification has been saved in /home/username/.ssh/id_rsa.
    Your public key has been saved in /home/username/.ssh/id_rsa.pub.

Upload the public key (contents of ` ~/.ssh/id_rsa.pub`) to Github under [Account Settings, SSH Public Keys](https://github.com/account). Refer to [troubleshooting ssh issues](http://help.github.com/troubleshooting-ssh/) if you're having problems.

You should now be able to connect to Github.

    $ ssh -T git@github.com
    Hi username! You've successfully authenticated, but GitHub does not provide shell access.

Install Git
-----------

Install [Git](http://git-scm.com/download).

    sudo apt-get install git

Set your username and email.

    git config --global user.name "Firstname Lastname"
    git config --global user.email "your_email@youremail.com"

Build Essentials
----------------

You'll need a working C compiler along with several other packages.

    sudo apt-get install build-essential bison openssl libreadline5 libreadline-dev curl git-core zlib1g zlib1g-dev libssl-dev libreadline-dev libxml2-dev autoconf libxslt-dev libpq5 libpq-dev

Install Ruby w/ RVM
-------------------

RVM is a virtual environment for Ruby that sandboxes Ruby development. One of the things RVM can do is implode: self-destruct so you can start fresh.

Install [RVM](http://rvm.beginrescueend.com/).

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

Add RVM path and initialization command to your `.bash_profile` using your favorite text editor.

    export PATH=$PATH:/usr/local/rvm/bin
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

Open a new shell and test RVM. The following should return `rvm is a function`.

    $ type rvm | head -1 # numeral one
    rvm is a function

Install Ruby 1.9.2, RubyGems, Rails, and set up a gemset.

    rvm install 1.9.2
    rvm --default 1.9.2

If you're having trouble compiling, check `.rvm/log/make.log`.

Test Ruby
---------

    ruby -e "puts :Hello"

This should output "Hello".

PostgreSQL
----------

We'll use PostgreSQL with our Rails application. Download and install from [here](http://www.enterprisedb.com/products-services-training/pgdownload).

