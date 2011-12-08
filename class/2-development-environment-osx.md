Getting Started on Mac OSX
==========================

The following instructions are heavily inspired from [here](http://help.github.com/mac-set-up-git/).

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

Configure your username and email.

    git config --global user.name "Firstname Lastname"
    git config --global user.email "your_email@youremail.com"

Build Essentials
----------------

Install XCode 4.1 or older from [here](https://developer.apple.com/downloads/download.action?path=Developer_Tools/xcode_4.1_for_lion/xcode_4.1_for_lion.dmg). XCode 4.2 is known to have issues, but might work.

Install Ruby
------------

Install [RVM](http://rvm.beginrescueend.com/).

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

Add RVM path and initialization command to your `.bash_profile`

    export PATH=$PATH:/usr/local/rvm/bin
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

Open a new shell and test RVM. The following should return `rvm is a function`.

    $ type rvm | head -1 # numeral one
    rvm is a function

On OSX switch from the default C compiler to GCC.

    export CC="/usr/bin/gcc-4.2" 
    export ARCHFLAGS="-arch x86_64"
    export ARCHS="x86_64"

Install Ruby 1.9.2, RubyGems, Rails, and set up a gemset.

    rvm install 1.9.2
    rvm --default 1.9.2

Test Ruby
---------

    ruby -e "puts :Hello"

Install Homebrew
----------------

Homebrew is a package manager we'll use for a few components.

    ruby -e "$(curl -fsSLk https://gist.github.com/raw/323731/install_homebrew.rb)"

See [installation instructions](https://github.com/mxcl/homebrew/wiki/installation) for any issues.

PostgreSQL
----------

We'll use PostgreSQL with our Rails application. Download and install from [here](http://www.postgresql.org/download/).

Next
====

[Introduction to GIT with Github and Developer Workflow](3-git-workflow.md)

