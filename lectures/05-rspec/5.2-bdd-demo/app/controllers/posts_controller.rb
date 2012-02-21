class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def new
    @post = Post.new(user: current_user)
  end

  def create
    @post = Post.create!(params[:post].merge( { user: current_user } ))
    redirect_to post_path(@post)
  end
end
