class CommentsController < ApplicationController
  def new
    @post = find_post
    @user = @post.author
    @comment = @post.comments.new
  end

  def create
    @post = find_post
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      flash[:success] = 'The comment of the post was created successfully!'
      redirect_to user_post_path(@post.author, @post)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
