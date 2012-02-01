require 'sass'

s = <<-EOS
$default-color: red
$navbar-width: 640px

#navbar
  width: $navbar-width
  height: 23px
  ul
    list-style-type: none
  li
    float: left
    a
      font-weight: bold
      color: $default-color
  &:hover
    color: #ffb3ff
    width: $navbar-width - 10px
EOS

e = Sass::Engine.new s

puts e.render


