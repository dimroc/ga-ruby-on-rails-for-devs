Display Database Configuration with Rake
========================================

Implement a `db:config` task in `lib/tasks/db.rake` that displays the database configuration. 

*Tip: database configuration is stored in `config/database.yml` and is in the YAML format.*

You should be able to run `rake db:config` and see an output as follows.

    {"adapter"=>"postgresql", "username"=>"rails", "password"=>"password", "host"=>"localhost", "port"=>5432, "database"=>"rails_development"}

