require 'spec_helper'

describe ThingsController do

  before :each do
    sign_in Fabricate :user
  end
  
  context "with mocks" do

    def mock_thing(stubs = {})
      @mock_thing ||= mock_model(Thing, stubs).as_null_object
    end

    describe "GET index" do
      
      it "assigns all things to @things" do
        Thing.stub!(:all).and_return [ mock_thing ]
        get :index
        assigns(:things).should eq [ mock_thing ]
      end
      
    end
    
    describe "GET new" do
      
      it "assigns a new thing as @thing" do
        Thing.stub(:new).and_return mock_thing
        get :new
        assigns(:thing).should be mock_thing
      end

    end

    describe "GET edit" do

      it "assigns the requested thing as @thing" do
        Thing.stub(:find).with("37").and_return mock_thing
        get :edit, :id => "37"
        assigns(:thing).should be mock_thing
      end

      it "redirects to 404 not found if thing doesn't exist" do
        get :edit, :id => "37"
        response.status.should == 404
      end

    end

    describe "POST create" do

      describe "with valid params" do

        it "assigns a newly created thing as @thing" do
          Thing.stub(:new).with({'these' => 'params'}).and_return mock_thing({:save => true})
          post :create, :thing => {'these' => 'params'}
          assigns(:thing).should be mock_thing
        end

        it "redirects to the list of things" do
          Thing.stub(:new).and_return mock_thing(:save => true)
          post :create, :thing => {}
          response.should redirect_to mock_thing
        end

      end

      describe "with invalid params" do

        it "assigns a newly created but unsaved thing as @thing" do
          Thing.stub(:new).with({'these' => 'params'}).and_return mock_thing(:save => false)
          post :create, :thing => {'these' => 'params'}
          assigns(:thing).should be mock_thing
        end

        it "re-renders the 'new' template" do
          Thing.stub(:new).and_return mock_thing({:save => false})
          post :create, :thing => {}
          response.should render_template "new"
        end

      end

    end

    describe "PUT update" do

      describe "with valid params" do

        it "assigns the requested thing as @thing" do
          Thing.stub(:find).and_return mock_thing({:update_attributes => true})
          put :update, :id => "1"
          assigns(:thing).should be mock_thing
        end

        it "redirects to the thing list" do
          Thing.stub(:find).and_return mock_thing({:update_attributes => true})
          put :update, :id => "1"
          response.should redirect_to mock_thing
        end

      end

      describe "with invalid params" do

        it "assigns the thing as @thing" do
          Thing.stub(:find).and_return mock_thing({:update_attributes => false})
          put :update, :id => "1"
          assigns(:thing).should be mock_thing
        end

        it "re-renders the 'edit' template" do
          Thing.stub(:find).and_return mock_thing({:update_attributes => false})
          put :update, :id => "1"
          response.should render_template "edit"
        end

      end

    end

    describe "DELETE destroy" do

      it "destroys the requested thing" do
        Thing.stub(:find).with("37").and_return mock_thing
        mock_thing.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the list of things" do
        Thing.stub(:find) { mock_thing }
        delete :destroy, :id => "1"
        response.should redirect_to things_url
      end

    end

  end
  
  context "with fabricators" do

    describe "GET index" do

      before(:each) do
        @thing = Fabricate(:thing)
      end

      it "assigns all things to @things" do
        get :index
        assigns(:things).count.should == 1
        assigns(:things).first.id.should == @thing.id
      end

    end

    describe "GET new" do

      it "assigns a new thing as @thing" do
        get :new
        assigns(:thing).is_a?(Thing).should be_true
      end

    end

    describe "GET edit" do

      before(:each) do
        @thing = Fabricate(:thing)
      end

      it "assigns the requested thing as @thing" do
        get :edit, :id => @thing.id.to_s
        assigns(:thing).id.should == @thing.id
      end

    end

    describe "POST create" do

      describe "with valid params" do

        it "creates a new thing" do
          post :create, :thing => {'name' => 'test'}
          Thing.count.should == 1
          Thing.last.name.should == "test"
        end

      end

    end

    describe "PUT update" do

      before(:each) do
        @thing = Fabricate(:thing)
      end

      describe "with valid params" do

        it "updates thing" do
          put :update, :id => @thing.id.to_s, :thing => { 'name' => 'updated' }
          @thing.reload.name.should == 'updated'
        end

      end

      describe "with invalid params" do

        it "doesn't update thing" do
          old_name = @thing.name
          put :update, :id => @thing.id.to_s, :thing => { 'name' => '' }
          @thing.reload.name.should == old_name
        end

      end

    end

    describe "DELETE destroy" do

      before(:each) do
        @thing = Fabricate(:thing)
      end

      it "destroys the requested thing" do
        delete :destroy, :id => @thing.id.to_s
        Thing.count.should == 0
      end

    end

  end
  
end
