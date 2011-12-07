module Incrementable
  def increment
    self.to_i + 1
  end
end

module Decrementable
  def decrement
    self.to_i - 1
  end
end

class Number
  # include instance methods
  include Incrementable
  include Decrementable
  
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_i
    @value.to_i
  end
  
end

n = Number.new(5)
puts n.increment # 6
puts n.decrement # 4

class Number
  def to_i
    @value.to_i + 10
  end
end

puts n.increment # 16
puts n.decrement # 14

    