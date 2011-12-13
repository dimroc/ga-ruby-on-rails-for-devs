# coding: utf-8

hash = { 
  "red" => "rouge",
  "yellow" => "jaune"
}

hash.each_pair do |name, value|
  puts "#{name}: #{value}"
end

hash = { 
  :red => { :french => "rouge", :russian => "красный" },
  :yellow => { :french => "jaune", :russian => "жёлтый" }
}

hash.each do |entry|
  puts "#{entry[0]} (#{entry[0].class}): #{entry[1][:french]}"
end

hash.each_pair do |name, value|
  puts "#{name} (#{name.class}): #{value}"
end

puts hash[:red][:russian] # "красный"

