require 'sass'

s = <<-EOS
=clearfix
  overflow: auto
  overflow: -moz-scrollbars-none
  display: inline-block
  &
    display: block

#left
  +clearfix
EOS

e = Sass::Engine.new s

puts e.render


