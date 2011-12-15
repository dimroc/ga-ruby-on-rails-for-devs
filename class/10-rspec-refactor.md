Refactoring with RSpec
======================

[RSpec](http://relishapp.com/rspec) is a Behaviour-Driven Development tool for Ruby programmers. BDD is an approach to software development that combines Test-Driven Development, Domain Driven Design, and Acceptance Test-Driven Planning. RSpec helps you do the TDD part of that equation, focusing on the documentation and design aspects of TDD.

Gemfile
-------

Gems from the test group aren't installed in production.

    group :test do
      gem "rspec", "~> 2.7"
      gem "rspec-rails", "~> 2.7"
      gem "rspec-core", "~> 2.7"
      gem "rspec-expectations", "~> 2.7"
      gem "rspec-mocks", "~> 2.7"
    end

Spec Helper
-----------

Included with every spec. Defines RSpec behavior, such as what to do before every test or after the test suite finished.

    require 'rubygems'

    ENV["RAILS_ENV"] ||= 'test'

    require "rails/application"
    require File.expand_path("../../config/environment", __FILE__)
    require 'rspec/rails'

    RSpec.configure do |config|
      config.mock_with :rspec
      config.expect_with :rspec
      config.after(:all) do
        p "All tests finished."
      end
    end

A Model Spec
------------

A simple test can execute model validations and ensure they perform as expected. Create `spec/models/thing_spec.rb`.

    require 'spec_helper'

    describe Thing do
      it "can be created with a name" do
        Thing.new({name: "thing"}).should be_valid
      end
      it "cannot be created without a name" do
        Thing.new.should_not be_valid
      end
    end

Mock Objects vs. Real Data
--------------------------

We'll use a real database for our testing instead of relying on mock objects. This means we need a clean copy of the database for every test. There's a gem for that.

    gem "database_cleaner"

We don't need to re-create a schema every time, just truncate tables.

    RSpec.configure do |config|
      config.before(:suite) do
        DatabaseCleaner.strategy = :truncation
      end
      config.before(:each) do
        DatabaseCleaner.clean
      end
    end

Ensure that you have a schema for tests.

    rake db:test:prepare

Run tests.

    rspec spec

Exercise: add [spork](https://github.com/sporkrb/spork) to the tests for a quicker Rails startup.


