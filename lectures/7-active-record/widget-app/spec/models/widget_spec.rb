require 'spec_helper'

describe Widget do
  it { should belong_to(:displayable) }

  describe "#gadgets" do
    let(:widget) { Fabricate(:widget) }
    it "should have gadgets" do
      expect {
        widget.gadgets << Fabricate.build(:gadget)
      }.to change { Gadget.count }.by(1)
    end
  end

  it "#controls" do
    widget = Fabricate(:widget_with_gadgets)
    widget.controls.first.should be_a(Control)
  end
end
