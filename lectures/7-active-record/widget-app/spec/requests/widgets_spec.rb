require 'spec_helper'

describe 'widgets' do
  before { 3.times { Fabricate(:widget_with_gadgets) } }
  it "should display a page" do
    visit widgets_path # testing our route and our controller
    current_path.should == widgets_path

    Widget.find_each do |widget|
      page.should have_content widget.name
      widget.gadgets.each do |gadget|
        page.should have_content gadget.name
      end

      widget.controls.each do |control|
        page.should have_content control.name
      end
    end
  end
end
