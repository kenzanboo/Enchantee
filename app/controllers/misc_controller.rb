class MiscController < ApplicationController
  before_filter :require_no_user, :only => :welcome
  
  def index
    if logged_in?
      redirect_to homepage_path and return
    else
      redirect_to welcome_path
    end
  end
  
  def welcome
    # TODO: This isn't very DRY, but it's necessary to make the login form partial work
    @user_session = UserSession.new
  end
end