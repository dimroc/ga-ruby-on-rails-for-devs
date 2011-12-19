class Thing
  def hello
    "world"
  end
end

t1 = Thing.new
t2 = Thing.new

def t2.hello
  "goodbye"
end

p t1.hello # "world"
p t2.hello # "goodbye"


