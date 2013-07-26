class ScreensController < ApplicationController
  before_filter :authenticate_user!

  def new
    @screen = Screen.new
  end

  def create
    @user = current_user
    @screen = @user.screens.build( screen_params )
    if @screen.save
      flash[:success] = "Upload Successfull"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def screen_params
      params.require(:screen).permit(:name, :description, :image)
    end
end
