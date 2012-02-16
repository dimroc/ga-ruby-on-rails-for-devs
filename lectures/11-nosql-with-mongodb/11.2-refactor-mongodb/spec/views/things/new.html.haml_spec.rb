require 'spec_helper'

describe "things/new.html.haml" do

  before(:each) do
    assign(:thing, Fabricate(:thing))
  end

  it "renders new thing form" do
    render
    assert_select "form", action: things_path, method: "post" do
      assert_select "input#thing_name", :name => "thing[name]"
    end
  end
  
end
