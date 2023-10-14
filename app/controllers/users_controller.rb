class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      # Handle the Log Out scenario
      sign_out current_user
      redirect_to root_path, notice: 'You have been logged out.'
    else
      @user = User.find(params[:id])
      @three_most_recent_posts = @user.posts.order(created_at: :desc).limit(3)
    end
  end
end
