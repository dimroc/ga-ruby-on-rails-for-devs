require 'spec_helper'

describe ThingsController do

  context "with mocks" do

    describe "GET index" do

      let(:mock_thing) { mock_model(Thing).as_null_object }

      it "returns things" do
        Thing.stub!(:all).and_return [ mock_thing ]
        get :index
        assigns(:things).should eq [ mock_thing ]
      end

      it "returns things" do
        Thing.should_receive(:all)
        get :index
      end

    end

    describe "GET thing" do

      it "fetches thing from the database" do
        Thing.should_receive(:find).with("42").once
        get :show, id: 42
      end

    end

  end
  
end
