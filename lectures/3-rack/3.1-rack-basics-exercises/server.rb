=begin

Implement a basic web server with Rack.

1. Server should be able to serve files from a `public` directory with `index.html` as the default file name. For example, using a browser one should be able to navigate to http://localhost:9292 or http://localhost:9292/index.html and see the contents of `index.html`.

|-Gemfile
|-server.rb
|+public
    |-index.html
    
2. Server should return the correct `Content-Length` header. The value of the Content-Length header is a string that contains the number of bytes that are sent from the server to the client.

3. Server should return a `404 Not Found` error if the file doesn't exist. For example, navigating to http://localhost:9292/invalid.html should produce a `404 Not Found` error.

4. Bonus point if the server can serve files in subfolders of `public`. For example, navigating to http://localhost:9292/subfolder/index.html or http://localhost:9292/subfolder/ should return a file from `public/subfolder/index.html`.

5. Bonus point if the server can also serve JPG images that render within an HTML page.

=end

require 'rubygems'
require 'rack'

class WebServer
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]
  end
end

Rack::Handler::Mongrel.run WebServer.new, :Port => 9292

