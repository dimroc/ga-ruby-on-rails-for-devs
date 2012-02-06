require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should_not allow_value("foo").for(:email) }
  it { should_not allow_value("@example.com").for(:email) }
  it { should allow_value("foo@example.com").for(:email) }
  context "with an existing user" do
    before :each do
      Fabricate(:user)
    end
    it { should validate_uniqueness_of(:email) }
  end
end

