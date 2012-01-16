require 'rubygems'
require 'rack'

class WebServer
  def call(env)
    # TODO: replace this with an implementation
    [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]
  end
end

Rack::Handler::Mongrel.run WebServer.new, :Port => 9292

