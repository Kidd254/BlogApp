class LikesController < ApplicationController
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      @like = @post.likes.build(user: @current_user)

      if @like.save
        redirect_to @post, notice: 'Liked the post!'
      else
        redirect_to @post, alert: 'Unable to like the post.'
      end
    end

    private

    def find_post
      @post = Post.find(params[:post_id])
    end
  end
end
