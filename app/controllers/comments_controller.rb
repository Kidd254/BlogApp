class CommentsController < ApplicationController
  before_action :authenticate_user! # Add authentication if needed

  # Display a list of comments (e.g., for a specific post)
  def index
    @comments = Comment.all # Fetch comments for a post
  end

  # Display a single comment
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params.merge(user: @current_user))

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render 'posts/show' # or wherever you want to redirect on failure
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
