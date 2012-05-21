require 'spec_helper'

describe Employee do
  context "validations" do
    it { should validate_presence_of :name }
    #TODO: Add validations for remaining fields
  end

  context "associations" do
    #TODO: Add specs to check for associations
  end

  context "fabricators" do
    #TODO: Add specs to ensure that fabricators create valid objects
  end
end
