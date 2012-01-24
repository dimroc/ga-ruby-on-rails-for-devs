require 'spec_helper'

describe "A Thing" do
  
  context "with a name" do
    
    let(:thing) { Thing.new }
    
    before(:each) do
      thing.name = "Name"
    end
    
    it "is valid" do
      thing.should be_valid
    end
    
    it "can be persisted" do
      thing.name = "Name"
      thing.save.should be_true
      Thing.count.should == 1
    end
    
  end

end
