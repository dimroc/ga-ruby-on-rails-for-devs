class Employee < ActiveRecord::Base
  attr_accessible :address, :name, :start_date
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :start_date

  belongs_to :role
end
