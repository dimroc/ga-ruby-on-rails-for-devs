require 'spec_helper'

describe "users/show.html.haml" do

  before(:each) do
    assign(:user, Fabricate(:user))
  end

  it "renders a user" do
    render
  end

end
