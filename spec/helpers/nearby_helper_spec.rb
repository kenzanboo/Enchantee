require 'spec_helper'

describe NearbyHelper do

  describe :haversine_distance do
    it "should find distance correctly" do
      distance = haversine_distance(39.06546, -104.88544, 39.06546, -104.80, :kilometers)
      distance.to_s.should match(/7\.376*/)
    end
  end

end