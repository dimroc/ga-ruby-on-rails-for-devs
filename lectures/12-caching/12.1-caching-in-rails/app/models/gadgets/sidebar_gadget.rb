class SidebarGadget < Gadget
  validates :dock_index, presence: true, numericality: true

  def info
    "sidebar gadget with specific functionality"
  end
end
