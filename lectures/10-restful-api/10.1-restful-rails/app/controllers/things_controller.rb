class ThingsController < ApplicationController
  before_filter :get_thing, :only => [ :show, :edit, :update, :destroy ]

  def index
    if params[:term]
      @things = Thing.find(:all,:conditions => ['name LIKE ?', "#{params[:term]}%"],  :limit => 5, :order => 'name')
    else
      @things = Thing.all
    end
    respond_to do |format|
      format.html
      format.json { render :json => @things }
      format.text { render :text => @things }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @thing }
      format.text { render :text => @thing }
    end
  end

  def edit
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(params[:thing])
    if @thing.save
      respond_to do |format|
        format.html { redirect_to @thing, notice: "Thing was successfully created." }
        format.json { render :json => @thing, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render :json => { "errors" => @thing.errors }, :status => 400 }
      end
    end
  end

  def update
    if @thing.update_attributes(params[:thing])
      respond_to do |format|
        format.html { redirect_to @thing, notice: "Thing was successfully updated." }
        format.json { render :json => @thing, :status => 200 }
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render :json => { "errors" => @thing.errors }, :status => 400 }
      end
    end
  end

  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url }
      format.json { render :json => @thing, :status => 200 }
    end
  end

  private

    def get_thing
      @thing = Thing.find(params[:id])
    end

end
