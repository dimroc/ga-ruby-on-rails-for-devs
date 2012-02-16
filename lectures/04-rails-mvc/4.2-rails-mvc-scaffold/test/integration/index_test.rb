require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "fetches the index.html page" do
    get "/"
    assert_response :success
    assert_select "title", "Ruby on Rails: Welcome aboard"
  end

end
