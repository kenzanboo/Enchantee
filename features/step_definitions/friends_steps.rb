Given /^I have bookmarked ([^ ]+)$/ do |username|
  friend = User.find_by_username(username)
  current_user.friendships.build(:friend_id => friend.id)
end
