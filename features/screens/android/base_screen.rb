class BaseScreen < AppiumWorld

  def base_screen
    @base_screen ||= BaseScreen.new
  end
end