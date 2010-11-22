class NearbyController < ApplicationController
  
  RADIUS = 0.2
  
  def index
    redirect_to :action => 'map'
  end
  
  def list
    @users = User.find(:all, :origin => current_user, :within => RADIUS, :order => 'distance')
  end
  
  def map
    @map = GMap.new("nearby_users")
    @map.center = make_marker(current_user)
    users = User.find(:all, :origin => current_user, :within => RADIUS, :order => 'distance')
    @map.markers = users.map do |user|
      make_marker(user)
    end
  end
  
  private
    def make_marker(user)
      Marker.new(user.latitude, 
                 user.longitude, 
                 user.name, 
                 @template.render(:partial => "user_short", :locals => {:user => user}))
    end
end