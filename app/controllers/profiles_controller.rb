class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @profile = @user.build_profile
  end

  def create
    @user = current_user
    @profile = @user.create_profile( profile_params )
    if @profile.save
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:name, :hardware, :avatar)
    end
end
