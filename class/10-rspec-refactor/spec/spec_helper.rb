require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do

  require "rails/application"
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'database_cleaner'
  
  RSpec.configure do |config|
    config.mock_with :rspec
    config.expect_with :rspec
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
    end
    config.before(:each) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
end

  

