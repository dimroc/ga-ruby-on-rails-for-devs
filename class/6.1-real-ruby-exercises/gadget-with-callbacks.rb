=begin

Implement a model called `Gadget` and a model called `Widget` that implements a callback in pure Ruby. A widget should contain a collection of gadgets. Every time a widget receives a gadget, invoke a `:when_added` callback. Every time a widget becomes empty, invoke a `:when_empty` callback.

=end

module CollectionNotifier
  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
    [:added, :empty].each do |event|
      define_method("when_#{event}") do |*callbacks|
        variable_name = "@_#{event}_callbacks"

        # initialize a class level instance variable
        instance_variable_set(variable_name, []) unless instance_variable_defined? variable_name

        callbacks.each do |callback|
          raise "when_added callback must be either be a string, a symbol, or callable"\
            unless callback.respond_to?(:call) || callback.is_a?(Symbol) || callback.is_a?(String)
          instance_variable_get(variable_name) << callback
        end
      end
    end
  end

  module InstanceMethods
    def self.included(base)
      [:added, :empty].each do |event|
        base.send(:define_method, "_invoke_#{event}_callbacks") do
          base.instance_variable_get("@_#{event}_callbacks").each do |callback|
            if callback.is_a? Proc
              callback.call
            else
              self.send(callback)
            end
          end
        end
      end
    end
  end
end

class Gadget
end

class Widget
  include CollectionNotifier

  # Add symbols, representing methods on the instance, and lambdas to the callback
  when_added :custom_add_function, ->{ p "Gadget added!"}
  when_empty :custom_empty_function, ->{ p "Widget is empty of gadgets!" }

  def initialize
    @_collection = []
  end

  def add(gadget)
    raise "Can only push gadgets" unless gadget.is_a? Gadget
    @_collection << gadget
    _invoke_added_callbacks
  end

  def pop
    if rval = @_collection.pop
      _invoke_empty_callbacks
      rval
    end
  end

  private

  def custom_add_function
    p "custom add function"
  end

  def custom_empty_function
    p "custom empty function"
  end
end

g = Gadget.new
w = Widget.new

w.add g
w.pop
w.pop
