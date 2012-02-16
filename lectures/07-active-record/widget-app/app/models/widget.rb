class Widget < ActiveRecord::Base
  has_many :gadgets
  has_many :controls, through: :gadgets

  # depends on two fields, displayable_id and displayable_type,
  # in the widgets schema to be polymorphic.
  belongs_to :displayable, polymorphic: true
end
