require 'spec_helper'

describe Widget do
  describe "associations" do
    it { should belong_to(:displayable) }
    it { should have_many :gadgets }
    it { should have_many(:controls).through(:gadgets) }

    describe "hard and still incomplete way" do
      context "#gadgets" do
        it "should have gadgets" do
          expect {
            widget = Fabricate(:widget)
            widget.gadgets << Fabricate.build(:gadget)
          }.to change { Gadget.count }.by(1)
        end
      end

      context "relying on fabrications" do
        it "#controls" do
          widget = Fabricate(:widget_with_gadgets)
          widget.controls.first.should be_a(Control)
        end
      end
    end
  end
end
