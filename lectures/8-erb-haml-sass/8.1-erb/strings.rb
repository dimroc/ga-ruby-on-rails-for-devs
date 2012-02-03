require 'erb'

s = "Ruby String"

e = ERB.new <<-EOS

<%# prints ERB is a Class %>
ERB is a <%= ERB.class.name %>
<%# prints value of string %>
String is <%= s %>

EOS

puts e.result

