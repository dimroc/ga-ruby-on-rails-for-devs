puts [ 1, 2 ].map{ |i| i * 2 }.inspect # 2, 4

puts [ 1, nil, 3, 5 ].map { |i| i.nil? }.inspect # false, true, false, false

