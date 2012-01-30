require 'spec_helper'

describe 'widgets' do
  before { 5.times { Fabricate(:widget) } }
  it "should display a page" do
    visit widgets_path # testing our route and our controller
    current_path.should == widgets_path

    Widget.find_each do |widget|
      page.should have_content widget.name
    end
  end
end
