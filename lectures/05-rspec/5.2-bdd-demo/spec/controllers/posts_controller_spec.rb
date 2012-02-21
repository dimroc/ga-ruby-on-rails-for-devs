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

    it "GET#new" do
      get :new
      post = assigns(:post)
      post.should_not be_nil
      post.should_not be_persisted
    end
  end
end
