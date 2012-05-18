To Do:
======

0. Continue from the assignment built in [**7.1 active-record-basic-exercises**](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/tree/master/class/7.1-active-record-basics-exercises)

1. Create a model called `Project` with a name:string and employees_count:integer field
2. Create a many-to-many relationship between `employee` and `project` using a join table\model called `EmployeeProject`.
    * Opt for has_many :through rather than has_many_and_belongs_to
3. Create a before_validation callback on `Project` that updates `employees_count` to the number of employees in this `project`.
4. Create a *custom* validation on `project` that ensures `employees_count` is a positive number

Bonus:
======

1. Using Single Table Inheritance (STI), create the sub-types `HrProject`, `MarketingProject`, and `DevelopmentProject`
    * Create a description method, not attribute, for each type that returns a hard-coded description of the project
    * Test drive each type with RSpec model specs

