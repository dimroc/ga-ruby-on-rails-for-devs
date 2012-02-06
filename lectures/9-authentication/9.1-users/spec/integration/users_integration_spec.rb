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
    fill_in "user_name", with: "new user"
    fill_in "user_email", with: "user@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
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

  describe "sign in/out" do

    describe "failure" do
      it "should not sign a user in" do
        visit signin_path
        fill_in :email,    :with => ""
        fill_in :password, :with => ""
        click_button
        response.should have_selector("div.flash.error", :content => "Invalid")
      end
    end

    describe "success" do
      it "should sign a user in and out" do
        user = Factory(:user)
        visit signin_path
        fill_in :email,    :with => user.email
        fill_in :password, :with => user.password
        click_button
        controller.should be_signed_in
        click_link "Sign out"
        controller.should_not be_signed_in
      end
    end
  end
  
end

