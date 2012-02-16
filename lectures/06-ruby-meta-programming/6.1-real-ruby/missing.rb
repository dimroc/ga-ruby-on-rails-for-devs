class Thing
  def method_missing(method, * args)
    if method.to_s[0..2] == "to_"
      "i am a #{method.to_s[3..-1]}"
    else
      super
    end
  end
end

p Thing.new.to_computer # "i am a computer"
# p Thing.new.invalid # NoMethodError

