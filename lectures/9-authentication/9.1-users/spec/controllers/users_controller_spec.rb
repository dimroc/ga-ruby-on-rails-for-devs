require 'spec_helper'

describe UsersController do

  context "with mocks" do

    def mock_user(stubs = {})
      @mock_user ||= mock_model(User, stubs).as_null_object
    end

    describe "GET index" do
      
      it "assigns all users to @users" do
        User.stub!(:all).and_return [ mock_user ]
        get :index
        assigns(:users).should eq [ mock_user ]
      end
      
    end
    
    describe "GET new" do
      
      it "assigns a new user as @user" do
        User.stub(:new).and_return mock_user
        get :new
        assigns(:user).should be mock_user
      end

    end

    describe "GET edit" do

      it "assigns the requested user as @user" do
        User.stub(:find).with("37").and_return mock_user
        get :edit, :id => "37"
        assigns(:user).should be mock_user
      end

      it "redirects to 404 not found if user doesn't exist" do
        get :edit, :id => "37"
        response.status.should == 404
      end

    end

    describe "POST create" do

      describe "with valid params" do

        it "assigns a newly created user as @user" do
          User.stub(:new).with({'these' => 'params'}).and_return mock_user({:save => true})
          post :create, :user => {'these' => 'params'}
          assigns(:user).should be mock_user
        end

        it "redirects to the list of users" do
          User.stub(:new).and_return mock_user(:save => true)
          post :create, :user => {}
          response.should redirect_to mock_user
        end

      end

      describe "with invalid params" do

        it "assigns a newly created but unsaved user as @user" do
          User.stub(:new).with({'these' => 'params'}).and_return mock_user(:save => false)
          post :create, :user => {'these' => 'params'}
          assigns(:user).should be mock_user
        end

        it "re-renders the 'new' template" do
          User.stub(:new).and_return mock_user({:save => false})
          post :create, :user => {}
          response.should render_template "new"
        end

      end

    end

    describe "PUT update" do

      describe "with valid params" do

        it "assigns the requested user as @user" do
          User.stub(:find).and_return mock_user({:update_attributes => true})
          put :update, :id => "1"
          assigns(:user).should be mock_user
        end

        it "redirects to the user list" do
          User.stub(:find).and_return mock_user({:update_attributes => true})
          put :update, :id => "1"
          response.should redirect_to mock_user
        end

      end

      describe "with invalid params" do

        it "assigns the user as @user" do
          User.stub(:find).and_return mock_user({:update_attributes => false})
          put :update, :id => "1"
          assigns(:user).should be mock_user
        end

        it "re-renders the 'edit' template" do
          User.stub(:find).and_return mock_user({:update_attributes => false})
          put :update, :id => "1"
          response.should render_template "edit"
        end

      end

    end

    describe "DELETE destroy" do

      it "destroys the requested user" do
        User.stub(:find).with("37").and_return mock_user
        mock_user.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the list of users" do
        User.stub(:find) { mock_user }
        delete :destroy, :id => "1"
        response.should redirect_to users_url
      end

    end

  end
  
  context "with fabricators" do

    describe "GET index" do

      before(:each) do
        @user = Fabricate(:user)
      end

      it "assigns all users to @users" do
        get :index
        assigns(:users).count.should == 1
        assigns(:users).first.id.should == @user.id
      end

    end

    describe "GET new" do

      it "assigns a new user as @user" do
        get :new
        assigns(:user).is_a?(User).should be_true
      end

    end

    describe "GET edit" do

      before(:each) do
        @user = Fabricate(:user)
      end

      it "assigns the requested user as @user" do
        get :edit, :id => @user.id.to_s
        assigns(:user).id.should == @user.id
      end

    end

    describe "POST create" do

      describe "with valid params" do

        it "creates a new user" do
          post :create, :user => {'name' => 'test', 'email' => 'user@example.com', 'password' => 'password', 'password_confirmation' => 'password'}
          User.count.should == 1
          User.last.name.should == "test"
        end

      end

    end

    describe "PUT update" do

      before(:each) do
        @user = Fabricate(:user)
      end

      describe "with valid params" do

        it "updates user" do
          put :update, :id => @user.id.to_s, :user => { 'name' => 'updated' }
          @user.reload.name.should == 'updated'
        end

      end

      describe "with invalid params" do

        it "doesn't update user" do
          old_name = @user.name
          put :update, :id => @user.id.to_s, :user => { 'name' => '' }
          @user.reload.name.should == old_name
        end

      end

    end

    describe "DELETE destroy" do

      before(:each) do
        @user = Fabricate(:user)
      end

      it "destroys the requested user" do
        delete :destroy, :id => @user.id.to_s
        User.count.should == 0
      end

    end

  end
  
end
