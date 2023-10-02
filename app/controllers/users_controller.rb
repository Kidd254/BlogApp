class UsersController < ApplicationController
  include ApplicationHelper
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(name: params[:name])
    if @user.nil?
      flash[:error] = "User not found"
      redirect_to '/' 
    end
  end
end
