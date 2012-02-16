require 'spec_helper'

feature "Sign in/out", :js => true do

  it "displays an error with an invalid e-mail and password" do
    visit signin_path
    fill_in 'session[email]', :with => "invalid@example.com"
    fill_in 'session[password]', :with => "password"
    click_button "Sign In"
    page.find(".alert").should have_content "Invalid email/password combination."
  end

  it "succeeds with a valid e-mail and password" do
    user = Fabricate :user
    visit signin_path
    fill_in 'session[email]', :with => user.email
    fill_in 'session[password]', :with => user.password
    click_button "Sign In"
    current_path.should == "/users/#{user.id}"
  end

end
