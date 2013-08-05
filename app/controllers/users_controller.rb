class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = params[:id].blank? ? current_user : User.find(params[:id])
    @feed_items = current_user.feed
  end


  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
