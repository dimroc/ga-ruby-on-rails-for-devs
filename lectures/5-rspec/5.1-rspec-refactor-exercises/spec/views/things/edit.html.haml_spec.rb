require 'spec_helper'

describe "things/index.html.haml" do

  before(:each) do
    assign(:thing, Fabricate(:thing))
  end

  it "renders the edit thing form" do
    # TODO
  end
end
