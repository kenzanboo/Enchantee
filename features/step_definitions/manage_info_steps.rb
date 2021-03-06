require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )have an interest "([^"]*)"$/ do |interest|
  #pending #check if user has the correct interest
  @user.interests.save(interest)
end

Given /^([^']+)'s interests include "([^"]*)"$/ do |username, interest|
  user = User.find_by_username(username)
  category = Category.create(:name => "Miscellaneous")
  user.interests.create(:name => interest, :category_id => category.id) 
end

Then /^(?:|I )should have an interest "([^"]*)"$/ do |interest|
  #pending #check if user has the correct interest
  @user.interests.should include(interest)
end

Then /^(?:|I )should not have an interest "([^"]*)"$/ do |interest|
  #pending #check if user has the correct interest
  @user.interests.should_not include(interest)
end

Then /^(?:|I )should have the name "([^"]*)"$/ do |name|
  
  User.find(@user.id).first_name.should == name
end

