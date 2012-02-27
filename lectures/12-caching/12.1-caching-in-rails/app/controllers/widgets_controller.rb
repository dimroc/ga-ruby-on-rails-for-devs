class WidgetsController < ApplicationController

  caches_action :index
  
  def index
    @widgets = Widget.all
  end

end

