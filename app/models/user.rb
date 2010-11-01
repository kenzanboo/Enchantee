class User < ActiveRecord::Base
  has_and_belongs_to_many :interests
  
  acts_as_authentic
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  
  def name
    first_name + " " + last_name
  end
  
end
