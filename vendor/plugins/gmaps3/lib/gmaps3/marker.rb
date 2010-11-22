module Gmaps3
  class Marker
    
    attr_accessor :latitude, :longitude, :title, :contents
    
    def initialize (latitude, longitude, title = "", contents = nil)
      self.latitude = latitude
      self.longitude = longitude
      self.title = title
      self.contents = contents
    end
    
    def contents_string()
      "'" + contents.gsub(/[']/, "\\\\'") + "'"
    end
    
    def title_string()
      "'" + title.gsub(/[']/, "\\\\'") + "'"
    end
  end
end