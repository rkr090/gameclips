class ScreensController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = current_user
    @screen = @user.screens.build( screen_params )
    if @screen.save
      flash[:success] = "Upload Successfull"
      redirect_to current_user
    else
      flash[:error] = "Upload Failed"
      redirect_to current_user 
    end
  end

  private

    def screen_params
      params.require(:screen).permit(:name, :description, :image)
    end
end
