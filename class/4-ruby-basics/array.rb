# containers may contain objects of any type
#  rouge (String)
#  1 (Fixnum)
#  1..5 (Range)
[ "rouge", 1, (1..5) ].each do |i|
  puts "#{i} (#{i.class})"
end

numbers = [ 1, 2, 3 ]
puts numbers[0] # 1
puts numbers[-1] # 3
puts numbers[5] # nil, converted to an empty string
puts numbers[5].class # NilClass

puts [ 1, nil, 3, 5 ].compact.inspect # [ 1, 3, 5]

puts [ [ 1, 2 ], [ 3 ], [], 4 ].flatten.inspect # [ 1, 2, 3, 4 ]

