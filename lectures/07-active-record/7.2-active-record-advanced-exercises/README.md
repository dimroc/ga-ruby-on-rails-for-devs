To Do:
======

0. Continue from the assignment built in [**7.1 active-record-basic-exercises**](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/tree/master/class/7.1-active-record-basics-exercises)

1. Create a model called `Project` with a name:string
2. Create a *custom* validation on `Project` that ensures `name` is not blank (do not use the built in validation).
3. Create a many-to-many relationship between `employee` and `project` using a join table\model called `EmployeeProject`.
    * Opt for has_many :through rather than has_many_and_belongs_to
4. Add a field to `Role` of type `employees_count:integer`.
5. Create a before_save callback on `Role` that updates `employees_count` to the number of employees in this `role`.
6. Using Single Table Inheritance (STI), create the sub-types `HrProject`, `MarketingProject`, and `DevelopmentProject`
    * Create a description method, not attribute, for each type that returns a hard-coded description of the project
    * Test drive each type with RSpec model specs

Bonus:
------

1. Polymorphic Association
    * Create a new table called `Feedback` with fields `feedback:text`, `feedbackable_id:integer`, `feedbackable_type:string`
    * Set up a polymorphic association where `Employee`, `Role`, and `Project` has_many feedback.
