Rack Basics
===========

Bundler
-------

Bundler is a package manager that sandboxes an application or library. Libraries are called *gems*. 

Create a *Gemfile* that requires Rack and Mongrel, a web server.

    source "http://rubygems.org"

    gem "rack", "1.3.5"
    gem "mongrel", "1.2.0.pre2"

Install gems.

    $ bundle install
    Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.

Rack
----

Rack provides a minimal, modular and adaptable interface for developing web applications in Ruby. 
It includes basic implementations of request, response, cookies & sessions. And a good number of usefult middlewares.

Server
------

A simple Rack server responds to a single HTTP request.

    require 'rubygems'
    require 'rack'

    class HelloWorld
      def call(env)
        [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]
      end
    end

    Rack::Handler::Mongrel.run HelloWorld.new, :Port => 9292

It can be run with ruby.

    $ ruby server.rb

Navigate to [localhost:9292](http://localhost:9292/).

Next
====

Lets look at a [web application with Rails](7-rails-basics.md).

