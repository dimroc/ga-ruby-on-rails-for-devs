class Widget < ActiveRecord::Base
  has_many :gadgets
  has_many :controls, through: :gadgets
end
