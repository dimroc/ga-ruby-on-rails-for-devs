# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Not ideal for actual development or deployment purposes!
# For demonstration purposes only, seed development database with fabricated data:

3.times { Fabricate(:desktop_with_widgets) }
1.times { Fabricate(:webpage_with_widgets) }
