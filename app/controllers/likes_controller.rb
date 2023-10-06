class LikesController < ApplicationController
  before_action :find_post, only: :create

  def create
    like = @post.likes.create(user: current_user)

    if like.persisted?
      flash[:notice] = 'Liked the post!'
      redirect_to user_post_path(@post.author, @post) # Use user_post_path with the author and post as arguments
    else
      flash[:alert] = 'Unable to like the post.'
      redirect_to user_post_path(@post.author, @post) # Use user_post_path with the author and post as arguments
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Post not found.'
    redirect_to root_path
  end
end
