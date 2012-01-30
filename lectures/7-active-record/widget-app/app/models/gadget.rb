class Gadget < ActiveRecord::Base
  belongs_to :widget
  has_many :controls
end
