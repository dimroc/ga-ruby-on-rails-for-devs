Live Rails MVC Application
==========================

Rails Scaffold
--------------

Rails scaffold can generate a working rails application in a single command.

    $ rails new rails-basics

Model View Controller
---------------------

An HTTP request is sent to a *controller* via a route drawn in `config/routes.rb`. A controller is a class that inherits 
from `ApplicationController`, which inherits from `ActionController::Base`. It will typically renders a corresponding *view*,
which is a template in ERB, HAML or other format that gets converted to HTML. These templates often use a specific *layout*.
The view is more often populated with data from a *model* that is usually retrieved from a database. 

An Integration Test
-------------------

Create a new test fixture.

    rails generate integration_test index

This creates a test in `test/integration/index_test.rb`. We can add some meat to it, checking that we can render the index.html page with a proper title.

    require 'test_helper'

    class IndexTest < ActionDispatch::IntegrationTest
      fixtures :all

      test "fetches the index.html page" do
        get "/"
        assert_response :success
        assert_select "title", "Ruby on Rails: Welcome aboard"
      end

    end

Asserts come from [ActionDispatch::Assertions](http://apidock.com/rails/ActionDispatch/Assertions).

Run tests with `rake test`.

Switch from SQLLite to PostgreSQL
---------------------------------

Heroku doesn't support SQLLite. Lets switch to PostgreSQL.

    (as postgres admin user)
    psql template1  

    create role myapp with createdb login password 'myapp';  // 'login' is optional if you plan to use psql

Change `sqlite` to `pg` in `Gemfile` and run `bundle install`.

Edit `config/database.yml`.

    common: &common
      adapter: postgresql
      username: rails
      password: password

    development:
      <<: *common
      database: rails_development

    test:
      <<: *common
      database: rails_test

    production:
      <<: *common
      database: rails_production

Create the databases.

    rake db:create:all

Assets
------

In Rails assets are precompiled.

    RAILS_ENV=production rake assets:precompile
    git add public/assets
    git commit -m "vendor compiled assets"

Deploy to Heroku
----------------

Heroku provides hosting for Rails applications and GIT-based workflow for deployment. Create an account on [heroku.com](http://www.heroku.com/).

    gem install heroku
    heroku keys:add

Create an application.

    $ heroku create dblock-rails-mvc --stack cedar
    Creating dblock-rails-mvc... done, stack is bamboo-mri-1.9.2
    http://dblock-rails-mvc.heroku.com/ | git@heroku.com:dblock-rails-mvc.git

Setup a *heroku* remote. This is a GIT-based destination to which we can *push* code. You can see your remotes with `git remote -v`.

    $ git remote add heroku git@heroku.com:dblock-rails-mvc.git

Push the application to Heroku.

    $ git push heroku master

Open a browser, `heroku open`.

Scaffold Domain Model
---------------------

    rails generate scaffold Thing name:string description:string
    
This creates a model, controller, views, a database migration script, udpates the schema and writes basic tests.
