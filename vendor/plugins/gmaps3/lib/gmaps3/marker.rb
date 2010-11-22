module Gmap3
  class Marker
    
    attr_accessor :latitude, :longitude, :title, :contents
    
    def initialize (latitude, longitude)
      self.latitude = latitude
      self.longitude = longitude
    end
    
    def contents_string()
      "'" + contents.gsub(/[']/, "\\\\'") + "'"
    end
    
    def title_string()
      "'" + title.gsub(/[']/, "\\\\'") + "'"
    end
  end
end