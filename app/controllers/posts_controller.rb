class PostsController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @new_post = Post.new
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    new_post = current_user.posts.new(post_params)
    if new_post.save
      flash[:success] = 'The Post was created successfully!'
      redirect_to user_post_path(current_user, new_post)
    else
      # Include new_post with errors
      @new_post = new_post
      render 'new'
    end
  end

  def addlike
    @post = find_post_by_id
    Like.create(post: @post, author: current_user) unless like_exists?(@post, current_user)
    redirect_to user_post_path(@post.author, @post)
  end

  def deletelike
    @post = find_post_by_id
    @post.likes.destroy_by(author: current_user) if like_exists?(@post, current_user)
    redirect_to user_post_path(@post.author, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def find_user_by_id
    User.find(params[:user_id])
  end

  def find_post_by_id
    Post.find(params[:id])
  end

  def like_exists?(post, user)
    @like = post.likes.where(author: user)
    @like.exists?
  end
end
