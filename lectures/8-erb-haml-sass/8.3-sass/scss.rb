require 'sass'

s = <<-EOS
#navbar {
  width: 100%
}
EOS

e = Sass::Engine.new s, { :syntax => :scss }

puts e.render


