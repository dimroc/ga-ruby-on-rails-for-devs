=begin

Implement a model called `Gadget` and a model called `Widget` that implements a callback in pure Ruby. A widget should contain a collection of gadgets. Every time a widget receives a gadget, invoke a `:when_added` callback. Every time a widget becomes empty, invoke a `:when_empty` callback.

=end

module CollectionNotifier
  Events = [:added, :empty]

  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
  end

  module ClassMethods

    Events.each do |event|

      # Create 'when_<event>' class method
      define_method("when_#{event}") do |*callbacks|
        variable_name = "@_#{event}_callbacks"

        # initialize a class level instance variable
        instance_variable_set(variable_name, []) unless instance_variable_defined? variable_name

        callbacks.each do |callback|
          raise ArgumentError, "when_added callback must be either be a string, a symbol, or callable"\
            unless callback.respond_to?(:call) || callback.is_a?(Symbol) || callback.is_a?(String)
          instance_variable_get(variable_name) << callback
        end
      end
    end
  end

  module InstanceMethods

    # Create '_invoke_<event>_callbacks' to allow one to invoke event callbacks
    def self.included(base)
      Events.each do |event|
        base.send(:define_method, "_invoke_#{event}_callbacks") do
          base.instance_variable_get("@_#{event}_callbacks").each do |callback|
            if callback.is_a? Proc
              callback.call
            else
              self.send(callback) # Send either symbol or string to calling instance
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

  # Add symbols, representing the methods on the instance, and lambdas to the callback
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
      _invoke_empty_callbacks if @_collection.count == 0
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
w.add g
w.pop
w.pop
