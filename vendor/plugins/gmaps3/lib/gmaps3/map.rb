module Gmaps3
  class GMap
    
    attr_reader :id
    attr_accessor :center
    attr_accessor :markers
    
    def width()
      @width
    end
    
    def width=(width)
      if width.is_a?(Integer) or width =~ /^[0-9]+$/
        @width = width.to_s + "px"
      else
        @width = width
      end
    end
    
    def height()
      @height
    end

    def height=(height)
      if height.is_a?(Integer) or height =~ /^[0-9]+$/
        @height = height.to_s + "px"
      else
        @height = height
      end
    end
    
    def initialize(id, width = 300, height = 300)
      @id = id
      self.width = width
      self.height = height
      self.markers = []
    end
    
    def self.api(options = {})
      options[:sensor] = options[:sensor] ? "true" : "false"
      query_string = "?v=3.3&sensor=" << options[:sensor]
      query_string << "&language=" << options[:language] if options[:language]
      query_string << "&region=" << options[:region] if options[:region]
      include_string = "<script type=\"text/javascript\" src=\"http://maps.google.com/maps/api/js#{query_string}\"></script>\n"
    end
    
    def write(options = {})
      options[:zoom] ||= 8
      options[:type] ||= "google.maps.MapTypeId.ROADMAP"
      var = options[:variable] || 'map'
      out = "<script type=\"text/javascript\">\n"
      out << "function initialize() {\n"
      out << "  var options = {\n"
      out << "    zoom: #{options[:zoom]},\n"
      out << "    center: new google.maps.LatLng(#{center.latitude},#{center.longitude}),\n"
      out << "    mapTypeId: #{options[:type]}\n"
      out << "  }\n"
      out << "  var #{var} = new google.maps.Map($('#{id}'), options);\n"
      out << "  var marker, infowindow;\n"
      markers.each do |marker|
        out << "  marker = new google.maps.Marker({\n"
        out << "    position: new google.maps.LatLng(#{marker.latitude},#{marker.longitude}),\n"
        out << "    map: #{var},\n"
        out << "    title: #{marker.title_string},\n"
        out << "  });\n"
        if marker.contents
          out << "  infowindow = new google.maps.InfoWindow({content:#{marker.contents_string}});\n"
          out << "  google.maps.event.addListener(marker, 'click', function() {\n"
          out << "    infowindow.open(#{var},marker);\n"
          out << "  });\n"
        end
      end
      out << "}\n"
      out << "Event.observe(window, 'load', initialize);\n"
      out << "</script>\n"
      out << "<style type=\"text/css\">\##{id} {width:#{width}; height:#{height}}"
      out
    end
    
    def div(options = {})
      attributes = "id=\"#{id}\""
      attributes << " class=\"#{options[:class]}\"" if options[:class]
      "<div #{attributes}></div>"
    end
  end
end
