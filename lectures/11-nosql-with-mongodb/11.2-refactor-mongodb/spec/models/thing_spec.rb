require 'spec_helper'

describe "A thing" do
  
  let :thing do 
    Thing.new
  end
  
  context "without a name" do
  
    it "is not valid" do
      thing.should_not be_valid
    end
    
    it "cannot be persisted" do
      thing.save.should be_false
      Thing.count.should eq 0
    end
    
  end
  
  context "with a name" do
        
    before :each do
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

    context "persisted" do
    
      before :each do
        thing.save.should be_true
      end
            
      it "must be unique" do
         Thing.new({ name: thing.name }).should_not be_valid
      end
    
    end
    
    it "can be deleted" do
      thing.destroy
      Thing.count.should == 0
    end
    
  end

end
