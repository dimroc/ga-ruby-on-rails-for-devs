require 'spec_helper'

describe "things/index.html.haml" do

  before(:each) do
    @thing = Fabricate :thing
    assign(:things, Thing.all)
  end

  it "renders a list of things" do
    render
    assert_select "tr>td", text: @thing.name, count: 1
  end
  
end
