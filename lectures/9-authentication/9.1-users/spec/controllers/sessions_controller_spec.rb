require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST 'create'" do

    describe "invalid signin" do

      it "should re-render the new page" do
        post :create, :session => { :email => "email@example.com", :password => "invalid" }
        response.should render_template 'new'
      end

      it "should have a flash.now message" do
        post :create, :session => { :email => "email@example.com", :password => "invalid" }
        flash.now[:error].should =~ /invalid/i
      end

    end

    describe "with valid email and password" do
    
      before(:each) do
        @user = Fabricate :user
      end

      it "should sign the user in" do
        post :create, :session => { email: @user.email, password: @user.password }
        controller.current_user.should == @user
        controller.should be_signed_in
      end

      it "should redirect to the user show page" do
        post :create, :session => { email: @user.email, password: @user.password }
        response.should redirect_to(user_path(@user))
      end
    end
    
    describe "DELETE 'destroy'" do
      
      it "should sign a user out" do
        sign_in Fabricate :user
        delete :destroy
        controller.should_not be_signed_in
        response.should redirect_to(root_path)
      end

    end
          
  end
end
