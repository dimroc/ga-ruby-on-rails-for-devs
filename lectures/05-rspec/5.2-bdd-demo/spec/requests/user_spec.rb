require 'spec_helper'

feature "user" do
  let!(:user) { User.create!(email: "user@email.com", password: "password") }
  describe "when logged out" do
    scenario "and logging in" do
      visit root_path
      click_link "log in"

      page.current_path.should == new_user_session_path

      fill_in "user_email", with: user.email
      fill_in "user_password", with: "password"
      click_on "Sign in"

      page.should have_content "Signed in"
      page.should have_content "log out"
    end
  end

  describe "when logged in" do
    before { sign_in user }
    scenario "and logging out" do
      click_link "log out"

      page.should have_content "Signed out"
      page.should have_content "log in"
    end
  end
end