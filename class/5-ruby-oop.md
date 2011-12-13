Ruby Objects
============

Basic Class
-----------

All classes inherit from `Object`. You can inherit from another class.

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

Instances can be created with `new` and are garbage collected.

    puts Color.new.inspect # <Color: @name=nil>
    puts Color.new("red").inspect # <Color: @name="red">

Exceptions
----------

Exceptions may be of `RuntimeError < StandardError < Exception` types. The shortcut for `raise 'error!'` produces a `RuntimeError`.

    begin
      raise "error!"
    rescue Exception => e
      puts e.inspect # #<RuntimeError: error!>
    end

Exceptions can be caught and retried.

    count = 1
    begin
      raise BadError.new("error!") if count <= 2
    rescue Exception => e
      count += 1
      puts e.inspect # #<BadError: error!> (twice)
      retry
    end

Mixins
------

You can mix instance methods into another class with `include`.

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

Mixins promote composition over inheritance.

Monkey Patching
---------------

Methods, classes, variables and everything else is defined when it's loaded. You can *monkey-patch* any classin Ruby.

    class Number
      def to_i
        @value.to_i + 10
      end
    end

    puts n.increment # 16
    puts n.decrement # 14

With great power comes great responsibility.

Reflection
----------

Reflection is built-in and methods can and are often defined at runtime. You can either monkey-patch a class or even open it and work around any privacy declarations.

    Color.methods
    Color.new.methods

    # Color.define_method :shine, lambda { "shiny #{name}" } - illegal, define_method is private
    Color.send(:define_method, :shine, lambda { "shiny #{name}" })
    puts Color.new("red").shine # shiny red

    Color.new.is_a?(Color) # true

Next
====

Lets look at a [web application with RACK](6-rack-basics.md).

