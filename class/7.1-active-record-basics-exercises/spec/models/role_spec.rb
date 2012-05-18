require 'spec_helper'

describe Role do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :department }
  end

  context "associations" do
    it { should have_many :employees }
  end

  context "fabricators" do
    it "should fabricate a valid role" do
      Fabricate.build(:role).should be_valid
    end
  end
end
