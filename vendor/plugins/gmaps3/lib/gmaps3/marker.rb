module Gmaps3
  class Marker
    
    attr_accessor :latitude, :longitude, :title, :contents
    
    def initialize (latitude, longitude, title = "", contents = nil)
      self.latitude = latitude
      self.longitude = longitude
      self.title = title
      self.contents = contents
    end
  end
end