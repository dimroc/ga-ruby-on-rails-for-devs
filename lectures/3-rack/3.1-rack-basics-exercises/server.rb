require 'rubygems'
require 'rack'

class WebServer
  def call(env)
    # TODO
  end
end

Rack::Handler::Mongrel.run WebServer.new, :Port => 9292

