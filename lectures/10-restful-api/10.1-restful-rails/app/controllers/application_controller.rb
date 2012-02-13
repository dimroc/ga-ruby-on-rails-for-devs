class ApplicationController < ActionController::Base

  rescue_from Exception, :with => :handle_exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  private
  
    def record_not_found(e)
      respond_to do |format|
        format.html { render file: "public/404.html", status: 404 }
        format.json { render :json => { "errors" => e.message }, :status => 404 }
      end
    end

    def handle_exception(e)
      respond_to do |format|
        format.html
        format.json  { render :json => { "errors" => e.message }, :status => 500 }
      end
    end
  
end
