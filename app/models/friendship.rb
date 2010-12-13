class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def validate
  	errors.add_to_base("You cannot save your own profile.") unless user_id != friend_id
  end
end
