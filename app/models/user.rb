class User < ActiveRecord::Base
  has_and_belongs_to_many :interests
  
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  
  acts_as_authentic
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude
                   
  validates_associated :interests

  after_update :save_interests
  
  def name
    first_name + " " + last_name
  end
  
  def interests_in_common_with(other)
    Set.new(interests).intersection(Set.new(other.interests)).size
  end
  
  def has_friend_with_id(id)
    friends.map do |friend|
      friend.id
    end.include? id
  end
  
  def interest_attributes=(interest_attributes)
    interest_attributes.each do |attribute|
      interests<<Interest.find_or_create_by_name(attribute)
    end
  end
  
  def save_interests
    interests.each do |interest|
      interest.save(false)
    end
  end
end
