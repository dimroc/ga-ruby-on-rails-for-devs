require 'spec_helper'

describe PostsController do
  describe "when logged out" do
    it "should not respond successfully" do
      get :index
      response.should_not be_success
    end
  end

  describe "when logged in" do
    before { sign_in user }
    let(:user) { User.create(email: "user@email.com", password: "password")}
    it "GET# index" do
      get :index
      assigns(:posts).should_not be_nil
    end

    it "POST#create" do
      title = Faker::Lorem.word
      content = Faker::Lorem.paragraph
      expect {
        post :create, post: { title: title, content: content }
        assigns(:post).should_not be_nil
      }.to change { Post.count }.by(1)
    end

    it "GET#new" do
      get :new
      post = assigns(:post)
      post.should_not be_nil
      post.should_not be_persisted
    end
  end
end
