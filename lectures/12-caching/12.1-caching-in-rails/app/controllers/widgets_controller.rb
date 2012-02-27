class WidgetsController < ApplicationController

  caches_page :index
  
  def index
    @widgets = Widget.all
  end

end

