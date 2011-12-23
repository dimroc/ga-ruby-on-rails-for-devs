require 'spec_helper'

describe ThingsController do

  context "with mock objects" do
    def mock_thing(stubs={})
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
      end
    end
    describe "GET edit" do
      it "assigns the requested thing as @thing" do
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "assigns a newly created thing as @thing" do
        end
        it "redirects to the list of things" do
        end
      end
      describe "with invalid params" do
        it "assigns a newly created but unsaved thing as @thing" do
        end
        it "re-renders the 'new' template" do
        end
      end
    end
    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested thing as @thing" do
        end
        it "redirects to the thing list" do
        end
      end
      describe "with invalid params" do
        it "assigns the thing as @thing" do
        end
        it "re-renders the 'edit' template" do
        end
      end
    end
    describe "DELETE destroy" do
      it "destroys the requested thing" do
      end
      it "redirects to the list of things" do
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
      end
    end
    describe "GET edit" do
      before(:each) do
        @thing = Fabricate(:thing)
      end
      it "assigns the requested thing as @thing" do
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new thing" do
        end
      end
    end
    describe "PUT update" do
      before(:each) do
        @thing = Fabricate(:thing)
      end
      describe "with valid params" do        
        it "updates thing" do          
        end
      end
      describe "with invalid params" do
        it "doesn't update thing" do
        end
      end
    end
    describe "DELETE destroy" do
      before(:each) do
        @thing = Fabricate(:thing)
      end
      it "destroys the requested thing" do
      end
    end
  end
   
end

