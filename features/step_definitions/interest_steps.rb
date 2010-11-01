require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am logged in as user "([^"]*)" with password "([^"]*)"$/ do |user_name, pword|
  #pending #authenticate the test user
  @user=User.create!(:username=>user_name, :password=>pword, :password_confirmation=>pword)#, :password_confirmation=>pword)
end

Given /^(?:|I )have an interest "([^"]*)"$/ do |interest|
  #pending #check if user has the correct interest
  @user.interests.save(interest)
end

Then /^(?:|I )should have an interest "([^"]*)"$/ do |interest|
  #pending #check if user has the correct interest
  @user.interests.should include(interest)
end

Then /^(?:|I )should not have an interest "([^"]*)"$/ do |interest|
  #pending #check if user has the correct interest
  @user.interests.should_not include(interest)
end