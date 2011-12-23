=begin

 Implement a `case` statement that displays whether an element of the following array is an odd number, even number or a letter: [ 1, 7, 'A', 2, 'Z' ]

    1: odd number
    7: odd number
    A: letter
    2: even number
    Z: letter

=end

[ 1, 7, 'A', 2, 'Z' ].each do |i|
  case
    when i.is_a?(String) then puts "#{i}: letter"
    when i % 2 == 0 then puts "#{i}: even number"
    when i % 2 == 1 then puts "#{i}: odd number"
  end
end

