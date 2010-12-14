class NearbyController < ApplicationController
  
  before_filter :require_location
  
  RADIUS = 0.2
  
  def index
    redirect_to :action => 'map'
  end
  
  def list
    @users = User.find(:all, :origin => current_user, :within => RADIUS, :order => 'distance').reject do |user|
      user.id == current_user.id
    end.sort do |u1, u2| 
      u2.interests_in_common_with(current_user) <=> u1.interests_in_common_with(current_user)
    end
  end
  
  def map
    unless current_user.latitude and current_user.longitude
      raise "User has no location"
    end
    @map = GMap.new("nearby_users")
    @map.center = make_marker(current_user)
    User.find(:all, :origin => current_user, :within => RADIUS, :order => 'distance').each do |user|
      @map.add_marker(make_marker(user))
    end
  end
  
  private
    def make_marker(user)
      Marker.new(user.latitude, 
                 user.longitude, 
                 user.name, 
                 @template.render(:partial => "user_shorter", :locals => {:user => user}))
    end
end