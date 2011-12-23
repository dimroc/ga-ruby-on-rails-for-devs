puts "Loading config.ru"

require ::File.expand_path('../config/environment',  __FILE__)

puts "Running HelloWorld::Application"

run HelloWorld::Application
