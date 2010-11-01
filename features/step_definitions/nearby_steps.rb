Given /^(?:|my )location is \(([-.0-9]+), ([-.0-9]+)\)$/ do |latitude, longitude|
  current_user = UserSession.find.record
  current_user.latitude = Float(latitude)
  current_user.longitude = Float(longitude)
  current_user.save()
end

Given /^there is a user (.+) with location \(([-.0-9]+), ([-.0-9]+)\)$/ do |username, latitude, longitude|
  user = create_user(username, 'supersecret')
  user.latitude = latitude
  user.longitude = longitude
  user.save()
end
