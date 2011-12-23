=begin

Add a `euclidian_distance` method to the `Hash` class that takes another `Hash` as a parameter and calculates the Euclidian distance with another Hash. A Euclidean distance between `{ :x => 1, :y => 2 }` and `{ :x => 3, :y => 4 }` is `(1 - 3)^2 + (2 - 4)^2`. 

    puts ( {}.euclidian_distance({}) ) # 0
    puts ( { :x => 10, :y => 20 }.euclidian_distance({}) ) # 500
    puts ( { :x => 2, :y => 3 }.euclidian_distance({ :z => 4, :t => 5 }) ) # 54
    puts ( { :x => 2, :y => 3 }.euclidian_distance({ :y => 4, :z => 5 }) ) # 30
    puts ( { :x => 2, :y => 3 }.euclidian_distance({ :y => 4, :x => 5 }) ) # 10

=end

class Hash
  
  def self.euclidian_distance(lhs, rhs)
    d = lhs.inject(0.0) do |s, (k,v)|
      s + (v - (rhs[k] || 0))**2
    end
    d = rhs.inject(d) do |s, (k,v)|
      lhs.has_key?(k) ? s : (s + v**2)
    end
    d
  end
  
  def euclidian_distance(rhs)
    Hash.euclidian_distance(self, rhs)
  end
  
end

puts ( {}.euclidian_distance({}) ) # 0
puts ( { :x => 10, :y => 20 }.euclidian_distance({}) ) # 500
puts ( { :x => 2, :y => 3 }.euclidian_distance({ :z => 4, :t => 5 }) ) # 54
puts ( { :x => 2, :y => 3 }.euclidian_distance({ :y => 4, :z => 5 }) ) # 30
puts ( { :x => 2, :y => 3 }.euclidian_distance({ :y => 4, :x => 5 }) ) # 10
