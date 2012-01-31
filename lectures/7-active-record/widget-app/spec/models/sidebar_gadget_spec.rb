require 'spec_helper'

describe SidebarGadget do
  describe "validations" do
    it { should validate_presence_of :dock_index}
    it { should validate_numericality_of :dock_index}
  end
end
