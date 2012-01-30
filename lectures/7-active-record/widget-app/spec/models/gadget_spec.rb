require 'spec_helper'

describe Gadget do
  describe "associations" do
    let(:gadget) { Fabricate(:gadget_with_controls) }
    it "#controls" do
      gadget.controls.first.should be_a(Control)
    end
  end

  describe "validations" do
    it "should validate the presence of type" do
      expect {
        Gadget.create!
      }.to raise_error

      expect {
        Gadget.create(type: "SomeGadget")
      }.to change { Gadget.count }.by(1)
    end
  end
end
