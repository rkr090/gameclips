module ScreensHelper

  def latest_screens
    Screen.last(5).reverse
  end
end
