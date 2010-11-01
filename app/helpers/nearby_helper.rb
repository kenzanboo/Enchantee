module NearbyHelper
  
  RAD_PER_DEG = 0.017453293
  
  def haversine_distance(lat1, lon1, lat2, lon2, units)
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    dlon_rad = dlon * RAD_PER_DEG
    dlat_rad = dlat * RAD_PER_DEG
    lat1_rad = lat1 * RAD_PER_DEG
    lon1_rad = lon1 * RAD_PER_DEG
    lat2_rad = lat2 * RAD_PER_DEG
    lon2_rad = lon2 * RAD_PER_DEG
    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))
    return earth_radius(units) * c
  end
  
  def earth_radius(units)
    case units
    when :feet then 20925525
    when :meters then 6378100
    when :kilometers then 6378
    when :miles then 3963
    else raise "Invalid units for radius"
    end
end