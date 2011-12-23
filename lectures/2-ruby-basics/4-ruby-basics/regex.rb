puts "Hello World" =~ /World/ # 6
puts Regexp.new(/World/).match("Hello World").inspect # #<MatchData "World">
