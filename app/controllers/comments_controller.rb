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

  # Create a new comment
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user # Assign the current user as the comment author

    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # Update an existing comment
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # Delete a comment
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id) # Adjust permitted parameters as needed
  end
end
