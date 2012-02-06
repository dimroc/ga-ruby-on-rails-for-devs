require 'spec_helper'

feature "Users", js: true do

  scenario "are displayed in a table" do
    user = Fabricate(:user)
    visit "/users"
    page.should have_css "td", text: user.name
  end

  scenario "can be displayed" do
    user = Fabricate(:user)
    visit "/users/#{user.id.to_s}"
    page.should have_content user.name
  end

  scenario "can be created" do
    visit "/users/new"
    fill_in "Name", with: "new user"
    click_button "Create User"
    User.count.should == 1
    User.last.name.should == "new user"
  end

  scenario "can be modified" do
    user = Fabricate(:user)
    visit "/users/#{user.id.to_s}/edit"
    fill_in "Name", with: "updated user"
    fill_in "Email", with: "updated@example.com"
    click_button "Update User"
    user.reload
    user.name.should == "updated user"
    user.email.should == "updated@example.com"
  end

  scenario "can be destroyed" do
    user = Fabricate(:user)
    visit "/users"
    page.evaluate_script('window.confirm = function() { return true; }')
    click_link "Destroy"
    User.count.should == 0
  end

end

