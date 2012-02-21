module BddDemo
  module RequestTestHelpers
    def sign_in(user)
      visit root_path
      click_link "log in"

      page.current_path.should == new_user_session_path

      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on "Sign in"

      page.should have_content "Signed in"
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include BddDemo::RequestTestHelpers, type: :request
end
