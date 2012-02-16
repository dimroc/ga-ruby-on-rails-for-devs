require 'spec_helper'

describe "users/edit.html.haml" do

  before(:each) do
    @user = Fabricate :user
    assign(:user, @user)
  end

  it "renders the edit user form" do
    render
    assert_select "form", action: user_path(@user), method: "post" do
      assert_select "input#user_name", :name => "user[name]"
    end
  end
end
