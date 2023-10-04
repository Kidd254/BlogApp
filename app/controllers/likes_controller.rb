class LikesController < ApplicationController
  class LikesController < ApplicationController
    before_action :authenticate_user! # Add authentication if needed

    # Create a new like for a resource (e.g., a post)
    def create
      @like = Like.new(like_params)
      @like.user = current_user # Assign the current user as the one who liked

      if @like.save
        redirect_to @like.liked_item, notice: 'Like was successfully created.'
      else
        render :new
      end
    end

    # Remove a like for a resource
    def destroy
      @like = Like.find(params[:id])
      @like.destroy

      redirect_to @like.liked_item, notice: 'Like was successfully removed.'
    end

    private

    def like_params
      params.require(:like).permit(:liked_item_id, :liked_item_type) # Adjust permitted parameters as needed
    end
  end
end
