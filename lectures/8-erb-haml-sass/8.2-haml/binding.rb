require 'haml'

class Hound

  def initialize
    @sound = "bow wow"
  end
  
  def public_binding
    binding
  end

end

t = %q{

= "The dog says #{@sound}"

}

dog = Hound.new

puts Haml::Engine.new(t).render(dog.public_binding)



