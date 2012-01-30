class Widget < ActiveRecord::Base
  has_many :gadgets
  has_many :controls, through: :gadgets

  belongs_to :displayable, polymorphic: true
end
