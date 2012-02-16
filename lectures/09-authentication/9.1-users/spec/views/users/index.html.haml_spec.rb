require 'spec_helper'

describe "users/index.html.haml" do

  before(:each) do
    @user = Fabricate :user
    assign(:users, User.all)
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: @user.name, count: 1
  end
  
end
