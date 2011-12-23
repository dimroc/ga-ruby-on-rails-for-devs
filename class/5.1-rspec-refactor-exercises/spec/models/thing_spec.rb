require 'spec_helper'

describe Thing do
  it "can be created with a name" do
    Thing.new({name: "thing"}).should be_valid
  end
  it "cannot be created without a name" do
    Thing.new.should_not be_valid
  end
  it "saves a thing in the database" do
    lambda { Thing.create!({name: "thing"}) }.should_not raise_error
    Thing.count.should == 1
  end
end
