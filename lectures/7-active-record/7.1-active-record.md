Complete Active Record
======================

ActiveRecord is the default Rails Object Relational Mapper (ORM) and is the core of *Model Driven Design*. It encourages *fat* models and *skinny* controllers.

* Wraps a row of data
* Encapsulates database access
* Adds domain logic.

It's important to note that, unlike Hibernate or JPA, ActiveRecord is a leaky abstraction, it just makes SQL things easier.

Basics
------

* A database table = a Ruby class
* Table names are plural and class names are singular
* Attributes are inferred from schema
* All tables have an Integer ID
* Deployment and upgrade is taken care of with migrations.

Quering
-------

* `Widget.find(:first)`
* `Widget.find(:all)` or `Widget.all`
* `Widget.find(1)`

Finders by field value are implemented using `method_missing`, eg. `find_by_name`.

A leaky and lightweight SQL abstraction is provided.

    Widget.find(:all,
      conditions: [ "username = ? and password = ?", username, password ],
      limit: 10,
      offset :10,
      oder: 'username',
      joins: 'accounts on user.account_id = accounts.id')

It's also possible to use `:select`, `:group` and `:include` (eager loading).

Saving
------

* `save` and `save!`
* `update_attributes` and `update_attributes!`
* `update_attribute` deemed dangerous

Transactions
------------

    Model.transaction do
       # ...
    end

Associations
------------

* `belongs_to`
* `has_many`
* `has_and_belongs_to_many` (HABTM)

Associations add methods to the class, eg. `widget.gadgets`.

Joins
-----

Joins are automatic with `:through`.

    class Widget < ActiveRecord::Base
      has_many :gadgets
      has_many :controls, :through => :gadgets
    end

Polymorphic Associations
------------------------

Polymorphic relationships are created between objects that belong to multiple models.

    class Widget < ActiveRecord::Base
      has_many :controls, as: :displayable
    end

    class Gadget < ActiveRecord::Base
      has_many :controls, as: :displayable
    end

    class Control < ActiveRecord::Base
      belongs_to :displayable, polymorphic: true
    end

Validators
----------

Validations are performed on callbacks via `validate`, `validate_on_create` or `validate_on_update` as well as through built-in `validates_presence_of`, `validates_uniqueness_of`, `validates_numericallity_of`, `validates_length_of`, etc.

Callbacks and Observers
-----------------------

Built-in callbacks, such as `before_validation`, allow participating in the object's lifecycle. Callbacks are instance methods. You can also create observers that derive from `ActiveRecord::Observer` that `observe Model` and implement callbacks, such as `after_create`.

Exercise
--------

TODO

