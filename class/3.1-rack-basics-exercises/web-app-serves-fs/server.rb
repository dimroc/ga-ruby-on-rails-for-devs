require 'rubygems'
require 'rack'

class WebServer
  def call(env)
    path_info = Rack::Utils.unescape(env['PATH_INFO'])
    path_info = "index.html" if path_info[-1] == '/'
    full_path = File.join("public", path_info)
    if File.exist?(full_path)
      puts "serving file: #{full_path}"
      content = File.read(full_path)
      [200, {
        "Content-Type" => "text/html",
        "Content-Length" => content.length.to_s,
      }, [content]]
    else
      puts "file not found: #{full_path}"
      [404, {}, []]
    end
  end
end

Rack::Handler::Mongrel.run WebServer.new, :Port => 9292

