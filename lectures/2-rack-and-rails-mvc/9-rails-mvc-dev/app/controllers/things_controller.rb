class ThingsController < ApplicationController

  # GET /things
  def index
    @things = Thing.all
  end

  # GET /things/1
  def show
    @thing = Thing.find(params[:id])
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
    @thing = Thing.find(params[:id])
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
    @thing = Thing.find(params[:id])
    if @thing.update_attributes(params[:thing])
      redirect_to @thing, notice: 'Thing was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /things/1
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy
    redirect_to things_url
  end
end
