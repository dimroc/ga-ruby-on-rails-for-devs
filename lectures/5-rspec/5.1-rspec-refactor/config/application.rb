require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require :default, Rails.env

YAML::ENGINE.yamler = 'syck'

module RailsMVC
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    # Enable the asset pipeline
    config.assets.enabled = true
    # Display deprecation notices
    config.active_support.deprecation = :stderr
  end
end
