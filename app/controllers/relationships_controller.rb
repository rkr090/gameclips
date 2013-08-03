class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user.id)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user.id)
  end
end
