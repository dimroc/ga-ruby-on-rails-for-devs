class UsersController < ApplicationController
  before_filter :get_user, :only => [ :edit, :show, :update, :destroy ]
  skip_filter :authenticate, :only => [ :new, :create ]
  
  def get_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "public/404.html", status: 404
    end
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /users/1
  def update
    if @user != current_user
      flash.now[:error] = "Cannot modify other users."
      render action: "edit"
    elsif @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /users/1
  def destroy
    if @user != current_user
      flash.now[:error] = "Cannot delete other users."
    else
      @user.destroy
      sign_out
    end
    redirect_to users_url
  end
end
