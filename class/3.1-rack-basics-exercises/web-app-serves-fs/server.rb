require 'rubygems'
require 'rack'

class WebServer
  def initialize
    @public_path = File.join(Dir.pwd, "public")
  end
  
  def call(env)
    path_info = Rack::Utils.unescape(env['PATH_INFO'])
    begin
      # resolve the full path
      full_path = File.expand_path(File.join(@public_path, path_info))
      # disallow relative paths above 'public'
      raise SecurityError unless full_path.start_with?(@public_path)
      # the default file name inside a folder is index.html
      full_path = File.join(full_path, "index.html") if File.directory?(full_path)
      # serve file content
      content = File.read(full_path)
      serve 200, env, content, Rack::Mime.mime_type(File.extname(full_path))
    rescue SecurityError
      serve 403, env, "permission denied: #{path_info}", "text/plain"
    rescue Errno::ENOENT
      serve 404, env, "file not found: #{path_info}", "text/plain"
    rescue Exception => e
      serve 500, env, e.message, "text/plain"
    end
  end

  def log(code, url, message)
    puts "#{code}: #{url} => #{message}"
  end
  
  def serve(code, env, content, mime_type)
    log code, env['PATH_INFO'], code == 200 ? "#{content.size} byte(s), #{mime_type}" : content
    # rack response
    [
      code, 
      {
        "Content-Type" => mime_type,
        "Content-Length" => content.length.to_s,
      }, 
      [ content ]
    ]
  end
  
end

puts "Server ready at http://localhost:9292"
Rack::Handler::Mongrel.run WebServer.new, :Port => 9292

