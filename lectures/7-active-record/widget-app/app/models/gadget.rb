class Gadget < ActiveRecord::Base
  TYPES = %w(SidebarGadget HeaderGadget)

  belongs_to :widget
  has_many :controls

  # Presence of type allows us to leverage Single Table Inheritance (STI)
  # in Rails. See SidebarGadget and HeaderGadget.
  validates :type, presence:true, inclusion: { in: TYPES }

  attr_accessible :type

  def info
    "regular old gadget"
  end
end
