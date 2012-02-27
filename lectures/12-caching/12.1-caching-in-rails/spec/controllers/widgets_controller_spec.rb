require 'spec_helper'

describe WidgetsController do
  it "should cache :index action" do
    Widget.should_receive(:all).once
    2.times { get :index }
  end
end
