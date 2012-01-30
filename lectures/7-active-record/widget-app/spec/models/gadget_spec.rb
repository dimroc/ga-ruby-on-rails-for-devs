require 'spec_helper'

describe Gadget do
  describe "associations" do
    let(:gadget) { Fabricate(:gadget_with_controls) }
    it "#controls" do
      gadget.controls.first.should be_a(Control)
    end
  end
end
