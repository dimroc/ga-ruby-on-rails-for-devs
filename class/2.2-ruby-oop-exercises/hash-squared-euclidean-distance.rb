=begin

Add a `squared_euclidean_distance` method to the `Hash` class that takes another `Hash` as a parameter and calculates the euclidean distance with another Hash. A Euclidean distance between `{ :x => 1, :y => 2 }` and `{ :x => 3, :y => 4 }` is `(1 - 3)^2 + (2 - 4)^2`.

    {}.squared_euclidean_distance({}) # 0
    { :x => 1, :y => 2 }.squared_euclidean_distance({ :z => 3 }) # 14
    { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :z => 5 }) # 30
    { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) # 10
    { :x => 10, :y => 20 }.squared_euclidean_distance({}) # 500
    {}.squared_euclidean_distance({ :x => 10, :y => 20 }) # 500

=end

class Hash

  def self.squared_euclidean_distance(lhs, rhs)
    keys = lhs.keys | rhs.keys
    keys.inject(0) do |d, key|
      d += ((lhs[key] || 0) - (rhs[key] || 0)) ** 2
    end
  end

  def squared_euclidean_distance(rhs)
    Hash.squared_euclidean_distance(self, rhs)
  end

end

raise "invalid distance between two different hashes" unless 14 == ( { :x => 1, :y => 2 }.squared_euclidean_distance({ :z => 3 }) )
raise "invalid distance between empty hashes" unless 0 == ( {}.squared_euclidean_distance({}) )
raise "invalid distance between two overlapping hashes" unless 10 == ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) )
raise "invalid distance between two partially overlapping hashes" unless 30 == ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :z => 5 }) )
raise "invalid distance between a hash and an empty hash" unless 500 == ( { :x => 10, :y => 20 }.squared_euclidean_distance({}) )
raise "invalid distance between an empty hash and a hash" unless 500 == ( {}.squared_euclidean_distance({ :x => 10, :y => 20 }) )
puts "correct results in squared_euclidean_distance"

