require 'spec_helper'

describe Post do
  describe "validations" do
    it { should validate_presence_of :content }
    it { should validate_presence_of :title }
    it { should validate_presence_of :user_id }
  end
end
