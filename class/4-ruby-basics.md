Ruby Basics
===========

Hello World
-----------

    $ ruby -e "puts 'Hello World'"
    Hello World

Lets put it in a file, `hello.rb`.

    puts "Hello World" # Hello World

Run it with `ruby`.

    $ ruby hello.rb
    Hello World

`'Hello World'` is a `String`, `'Hello World'.class` returns `String`.

    puts "Hello World".class # String
    puts 'Hello World'.class # String

Double-quoted strings are expanded.

    world = "World"
    puts "Hello #{world}" # Hello World
    puts 'Hello #{world}' # Hello #{world}

Strings
-------

    puts "Hello World".downcase # "hello world"

Manipulating objects, in general, returns copies.

    s = "Hello World"
    puts s.downcase # "hello world"
    puts s # "Hello World"

Operations with a bang (!) have consequences, ie. are performed in-place.

    puts s.downcase! # "hello world"
    puts s # "Hello World"

Regular expressions are built-in.

    puts "Hello World" =~ /World/

Loops
-----

A simple loop over each element of an array. The `1..5` syntax creates an instance of a class, `(1..5).class` will return `Range`.

    # a simple loop
    for i in 1..5
      puts i
    end

A loop with an iterator takes a *block*. 

    # a loop over an array
    (1..5).each do |i|
      puts i
    end

    # a loop 5 times, starts at zero
    5.times { |i|
      puts i
    }

Branches
--------

If-then-else uses `elsif`.

    # if / elsif / else
    if 2 + 2 == 5
      puts "2+2 is 5"
    elsif 2 + 2 == 4
      puts "2+2 is 4"
    else
      puts "2+2 is something else"
    end

Case will evaluate the argument once and `when` can contain an expression.

    # case / when / else
    case 2 + 2
    when 3 + 2 then puts "2+2 is 5"
    when 4 then puts "2+2 is 4"
    else puts "2+2 is something else"
    end

Arrays
------

You can loop over items in an array. The latter is often called a *container* and may include objects of any type.

    [ "rouge", 1, (1..5) ].each do |i|
      puts "#{i} (#{i.class})"
    end

Arrays are indexed from both ends and it's legal to access an object outside of the range.

    numbers = [ 1, 2, 3 ]
    puts numbers[0] # 1
    puts numbers[-1] # 3
    puts numbers[5] # nil, converted to an empty string
    puts numbers[5].class # NilClass

Hashes
------

Also known as a *dictionary*. 

    hash = { 
      "red" => "rouge",
      "yellow" => "jaune"
    }

    hash.each_pair do |name, value|
      puts "#{name}: #{value}"
    end

Hash keys and values can be of any type. It's often convenient to use *symbols* for a hash key and hashes for values.

    hash = { 
      :red => { :french => "rouge", :russian => "красный" },
      :yellow => { :french => "jaune", :russian => "жёлтый" }
    }

    hash.each_pair do |name, value|
      puts "#{name} (#{name.class}): #{value[:french]}"
    end

    puts hash[:red][:russian] # "красный"

Mapping
-------

Applies a block to each element and returns a new collection.

    puts [ 1, 2 ].map{ |i| i * 2 } # 2, 4

Injecting
---------

  [ 1, 2, 3, 4 ].inject(0) { |result, element| result + element } # => 10

Chaining
-------

Objects can be `tap`'ed.

    1.tap{ |i| puts i }.tap { |i| puts i * 2 } # 1, 2


