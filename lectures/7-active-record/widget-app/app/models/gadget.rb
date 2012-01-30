class Gadget < ActiveRecord::Base

  belongs_to :widget
  has_many :controls

  validates_presence_of :type

  attr_accessible :type

  def info
    "regular old gadget"
  end
end
