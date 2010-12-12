class NearbyController < ApplicationController
  
  before_filter :check_location
  
  RADIUS = 0.2
  
  def index
    redirect_to :action => 'map'
  end
  
  def list
    @users = User.find(:all, :origin => current_user, :within => RADIUS, :order => 'distance').sort_by {|user| user.interests_in_common_with current_user}
  end
  
  def map
    unless current_user.latitude and current_user.longitude
      raise "User has no location"
    end
    @map = GMap.new("nearby_users")
    @map.center = make_marker(current_user)
    users = User.find(:all, :origin => current_user, :within => RADIUS, :order => 'distance')
    @map.markers = users.map do |user|
      make_marker(user)
    end
  end
  
  private
    def check_location()
      raise "Error: User has no location" unless current_user != nil and current_user.latitude != nil and current_user.longitude != nil
    end
  
    def make_marker(user)
      Marker.new(user.latitude, 
                 user.longitude, 
                 user.name, 
                 @template.render(:partial => "user_short", :locals => {:user => user}))
    end
end