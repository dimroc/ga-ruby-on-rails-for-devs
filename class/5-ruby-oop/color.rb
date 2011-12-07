class Color

  def initialize(name = nil)
    @name = name
  end

  def name=(value)
    @name = value
  end

  def name
    @name
  end

end

puts Color.new.inspect # <Color: @name=nil>
puts Color.new("red").inspect # <Color: @name="red">

c = Color.new
c.name = "red"
puts c.inspect # <Color: @name="red">

puts Color.class # Class
puts Color.new.class # Color

puts Color.methods.count # Class, 95
puts Color.new.methods.count # Color, 58

# Color.define_method :shine, lambda { "shiny #{name}" } - illegal, define_method is private
Color.send(:define_method, :shine, lambda { "shiny #{name}" })
puts Color.new("red").shine # shiny red

puts Color.new.is_a?(Color) # true
