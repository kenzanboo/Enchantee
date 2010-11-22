class MiscController < ApplicationController
  def welcome
    # TODO: This isn't very DRY, but it's necessary to make the login form partial work
    @user_session = UserSession.new
  end
end