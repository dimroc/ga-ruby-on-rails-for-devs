def f1(& b)
  puts "#{b.class}"
  yield 
end

f1 do
  puts 'hello world' # Proc, hello world
end

class F

  def thing(& b)
    if block_given?
      yield @thing
    else
      @thing
    end
  end
  
  def thing=(value)
    @thing = value
  end

end

f = F.new
p f.thing # nil

f.thing = 42
p f.thing # 42

f.thing do |value|
  p value * 2 # 84
end


