class ThingsController < ApplicationController
  before_filter :get_thing, :only => [ :edit, :show, :update, :destroy ]

  def get_thing
    @thing = Thing.find(params[:id])
  end

  # GET /things
  def index
    @things = Thing.all
  end

  # GET /things/1
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  def create
    @thing = Thing.new(params[:thing])
    if @thing.save
      redirect_to @thing, notice: 'Thing was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /things/1
  def update
    if @thing.update_attributes(params[:thing])
      redirect_to @thing, notice: 'Thing was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /things/1
  def destroy
    @thing.destroy
    redirect_to things_url
  end
end

