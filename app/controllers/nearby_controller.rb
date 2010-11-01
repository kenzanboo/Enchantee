class NearbyController < ApplicationController
  
  RADIUS = 50
  UNITS = :feet
  
  def index
    redirect_to :action => 'map'
  end
  
  def list
    #latitude_range, longitude_range = delta_latlong current_user.latitude, current_user.longitude
    #@nearby = User.where(:latitude => latitude_range, :longitude => longitude_range)
  end
  
  def map
  end
end