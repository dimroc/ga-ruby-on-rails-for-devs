Rails Basics
============

Rails Scaffold
--------------

Rails scaffold can generate a working rails application in a single command.

    $ rails new hello-world

An application can then be run.

    $ cd hello-world
    hello-world$ rails s

    => Booting WEBrick
    => Rails 3.1.0 application starting in development on http://0.0.0.0:3000
    => Call with -d to detach
    => Ctrl-C to shutdown server
    [2011-12-07 16:29:35] INFO  WEBrick 1.3.1
    [2011-12-07 16:29:35] INFO  ruby 1.9.2 (2011-07-09) [x86_64-darwin11.2.0]
    [2011-12-07 16:29:35] INFO  WEBrick::HTTPServer#start: pid=20070 port=3000

Navigate to [localhost:3000](http://localhost:3000) to see your rails application.

You can also open a rails console with `rails c`.

That's too easy. Lets build a bare bones Rails application that can serve static pages, first. 

Bundler
-------

Create a *Gemfile* with the following contents.

    source "http://rubygems.org"

    gem "rails", "3.1"

Install gems.

    $ bundle install
    Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.

    $ rails --version
    Rails 3.1.0

Application
-----------

An application is declared in *config/application.rb*.

    # load libraries required on boot
    require File.expand_path('../boot', __FILE__)

    # the action controller that serves requests
    require "action_controller/railtie"

    # libraries required for the application to run
    Bundler.require :default, Rails.env

    # application itself
    module HelloWorld
      class Application < Rails::Application
        # Configure the default encoding used in templates for Ruby 1.9.
        config.encoding = "utf-8"
      end
    end

Boot
----

At boot we just need to setup bundler.

    # require rubygems that knows how to load gems
    require 'rubygems'

    # Assign to BUNDLE_GEMFILE the full path of Gemfile
    ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

    # require bundler, which in turn will load all the gems
    require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

Config.ru
---------

Rails uses Rack as the basis for its HTTP handling.

Config.ru is a convention by which we indicate how to run a Rack-based application.

Script/rails
------------

Script/rails is automatically run when you type `rails`. It loads `config/application.rb` and `config/boot.rb`.

Load Sequence
-------------

    $ rails s

    Loading script/rails
    Loading config/boot.rb
    Loading rails/commands
    Loading application.rb
    => Booting WEBrick
    => Rails 3.1.0 application starting in development on http://0.0.0.0:3000
    => Call with -d to detach
    => Ctrl-C to shutdown server
    Loading config.ru
    Loading config/environment.rb
    HelloWorld::Application.initialize!
    Loading config/routes.rb
    Running HelloWorld::Application
    [2011-12-07 17:24:35] INFO  WEBrick 1.3.1
    [2011-12-07 17:24:35] INFO  ruby 1.9.2 (2011-07-09) [x86_64-darwin11.2.0]
    [2011-12-07 17:24:35] INFO  WEBrick::HTTPServer#start: pid=20322 port=3000

