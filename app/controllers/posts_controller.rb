class PostsController < ApplicationController
  def index
    @users = User.all # Fetch all users
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
