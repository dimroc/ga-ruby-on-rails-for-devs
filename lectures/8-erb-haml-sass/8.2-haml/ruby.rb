require 'haml'

s = %q{
%ul
  -(1..5).each do |i|
    %li= i
}

e = Haml::Engine.new s
puts e.render


