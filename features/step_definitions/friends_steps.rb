Given /^([^ ]+) has bookmarked ([^ ]+)$/ do |subject, direct_object|
  debugger
  user, friend = User.find_by_username(subject), User.find_by_username(direct_object)
  user.friendships.create(:friend_id => friend.id)
end
