class UsersController < ApplicationController
  include ApplicationHelper
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(name: params[:name])
    @posts = @user.posts
    # rubocop:disable Style/GuardClause
    if @user.nil?
      flash[:error] = 'User not found'
      redirect_to users_path
    end
    # rubocop:enable Style/GuardClause
  end
end
