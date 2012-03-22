require 'spec_helper'

describe 'widgets' do

  before :each do
    3.times do
      Fabricate(:widget_with_gadgets)
    end
  end
  
  it "should display a page", :type => :request, :js => true do
    visit widgets_path
    
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
