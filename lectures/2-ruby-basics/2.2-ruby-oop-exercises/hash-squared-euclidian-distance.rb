=begin

Add a `squared_euclidean_distance` method to the `Hash` class that takes another `Hash` as a parameter and calculates the euclidean distance with another Hash. A Euclidean distance between `{ :x => 1, :y => 2 }` and `{ :x => 3, :y => 4 }` is `(1 - 3)^2 + (2 - 4)^2`.

    puts ( {}.squared_euclidean_distance({}) ) # 0
    puts ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) ) # 10
    puts ( { :x => 10, :y => 20 }.squared_euclidean_distance({}) ) # 500
    puts ( {}.squared_euclidean_distance({ :x => 10, :y => 20 }) ) # 500

=end

class Hash

  def self.squared_euclidean_distance(lhs, rhs)
    # TODO
  end

  def squared_euclidean_distance(rhs)
    Hash.squared_euclidean_distance(self, rhs)
  end

end

puts ( {}.squared_euclidean_distance({}) ) # 0
puts ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) ) # 10
puts ( { :x => 10, :y => 20 }.squared_euclidean_distance({}) ) # 500
puts ( {}.squared_euclidean_distance({ :x => 10, :y => 20 }) ) # 500

