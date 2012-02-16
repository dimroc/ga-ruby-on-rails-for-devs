require File.expand_path('../boot', __FILE__)

require "rails/all"

Bundler.require :default, Rails.env

module RailsMvc
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.active_support.deprecation = :log
    config.assets.enabled = true
  end
end

