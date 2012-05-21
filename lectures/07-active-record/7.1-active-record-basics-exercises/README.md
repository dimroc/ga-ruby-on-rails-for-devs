TODO:
=====

1. Create an Employee model with the following fields:
    * name
    * address
    * start_date
    * validate the presence of all fields
    * Have specs use shoulda matchers to ensure validations
2. Create a Role model with the following fields:
    * name:string
    * department:string
    * validate the presence of all fields
    * Have specs use shoulda matchers to ensure validations
3. Create an association where a role has many employees
    * Add a spec using the shoulda matcher
4. Create an association where the employee belongs to a role
    * Test drive using a shoulda matcher
5. Create a fabricator that creates a valid Employee
    * Write a spec to ensure it is valid

See the Employee and Role model specs (employee/role_spec.rb) for contexts and todos
