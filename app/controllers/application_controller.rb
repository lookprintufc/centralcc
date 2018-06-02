class ApplicationController < ActionController::Base

  private
  def get_user
    @user = current_user
  end
end
