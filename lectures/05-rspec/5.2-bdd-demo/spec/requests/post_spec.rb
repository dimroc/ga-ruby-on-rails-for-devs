require 'spec_helper'

feature "posts" do
  describe "when logged out" do
    scenario "should not be able to access posts" do
      visit root_path
      page.should_not have_content "see posts"

      # Ensure that visitor is redirected to sign in page when
      # trying to access posts
      visit posts_path
      page.current_path.should == new_user_session_path
    end
  end

  describe "when logged in" do
    before do
      # Both of these create invocations are a perfect scenario for Fabricator or Factory_Girl
      user = User.create!(email: "user@email.com", password: "password")
      Post.create(user: user, title: "some title", content: "Some content")
      sign_in user
    end
    scenario "should be able to create a post" do
      # From homepage, see post listing
      visit root_path
      click_link "see posts"

      page.current_path.should == posts_path
      page.should have_content Post.last.title

      # Create post with fake content
      click_link "create post"

      page.current_path.should == new_post_path
      title = Faker::Lorem.word
      content = Faker::Lorem.paragraph

      fill_in "post_title", with: title
      fill_in "post_content", with: content

      # Assert that post is actually created with desired content
      expect {
        click_on "Create Post"
      }.to change { Post.count }.by(1)

      post = Post.last
      page.current_path.should == post_path(post)
      page.should have_content content
      page.should have_content title

      # Assert that we can return to post listings
      click_on "see posts"
      page.current_path.should == posts_path
    end
  end
end
