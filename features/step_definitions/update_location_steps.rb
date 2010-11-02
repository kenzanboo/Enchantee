Then /^"([^"]*)" should have a latitude "([^"]*)"$/ do |arg1,arg2|
  
  User.find_by_username(arg1).latitude == arg2
  

end

Then /^"([^"]*)" should have a longitude "([^"]*)"$/ do |arg1, arg2|
  User.find_by_username(arg1).longitude == arg2
end

