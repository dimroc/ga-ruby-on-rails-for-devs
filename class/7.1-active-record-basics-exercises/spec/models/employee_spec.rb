require 'spec_helper'

describe Employee do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :start_date }
  end

  context "associations" do
    it { should belong_to :role }
  end

  context "fabricators" do
    it "should fabricate a proper object" do
      Fabricate.build(:employee).should be_valid
    end
  end
end
