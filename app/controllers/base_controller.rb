class BaseController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  before_action :get_user

end