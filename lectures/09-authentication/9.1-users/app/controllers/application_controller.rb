class ApplicationController < ActionController::Base
  include SessionsHelper
  
  before_filter :authenticate

  def authenticate
    redirect_to :signin unless signed_in?
  end
end
