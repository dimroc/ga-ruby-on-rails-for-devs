require 'spec_helper'

feature "Users", js: true do

  scenario "can be created" do
    visit "/users/new"
    fill_in "user_name", with: "new user"
    fill_in "user_email", with: "user@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Create User"
    User.count.should == 1
    user = User.last
    user.name.should == "new user"
    user.email.should == "user@example.com"
  end
  
  context "logged in" do
    
    before :each do
      @user = Fabricate :user
      visit signin_path
      fill_in 'session[email]', :with => @user.email
      fill_in 'session[password]', :with => @user.password
      click_button "Sign In"
    end
    
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
  
    pending "cannot edit other users than self"
    pending "ccannot destroy other users than self"
    
    scenario "can be modified" do
      visit "/users/#{@user.id.to_s}/edit"
      fill_in "Name", with: "updated user"
      fill_in "Email", with: "updated@example.com"
      click_button "Update User"
      @user.reload
      @user.name.should == "updated user"
      @user.email.should == "updated@example.com"
    end
  
    scenario "can be destroyed" do
      visit "/users"
      page.evaluate_script('window.confirm = function() { return true; }')
      click_link "Destroy"
      User.count.should == 0
      current_path.should == "/signin"
    end
    
  end

end

