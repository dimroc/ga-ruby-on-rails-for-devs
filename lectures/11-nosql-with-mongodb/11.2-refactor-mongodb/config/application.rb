require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"

Bundler.require :default, Rails.env

module RailsMvc
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.active_support.deprecation = :log
    config.assets.enabled = true
  end
end

