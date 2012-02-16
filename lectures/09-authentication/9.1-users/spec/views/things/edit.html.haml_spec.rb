require 'spec_helper'

describe "things/edit.html.haml" do

  before(:each) do
    @thing = Fabricate :thing
    assign(:thing, @thing)
  end

  it "renders the edit thing form" do
    render
    assert_select "form", action: thing_path(@thing), method: "post" do
      assert_select "input#thing_name", :name => "thing[name]"
    end
  end
end
