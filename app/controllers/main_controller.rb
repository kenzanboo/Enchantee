class MainController < ActionController::Base
  
  before_filter :require_user, :only=> [:home]
  
  def welcome
    
  end
  
  def home
    
  end
end