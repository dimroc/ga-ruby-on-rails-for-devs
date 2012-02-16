f = Proc.new { p @thing }
f.call # nil

l = lambda { p @thing }
l.call # nil

@thing = 42

f.call # 42
l.call # 42

# parameter checking is different

f = Proc.new { |t| p t }
f.call 1, 2 # 1

l = lambda { |t| p t }
# l.call 1, 2 # ArgumentError 





