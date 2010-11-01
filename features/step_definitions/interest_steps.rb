require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am logged in as user "([^"]*)" with password "([^"]*)"$/ do |user_name, password|
  pending #authenticate the test user
end

Given /^(?:|I )have an interest "([^"]*)"$/ do |interest|
  pending #check if user has the correct interest
end

Then /^(?:|I )should have an interest "([^"]*)"$/ do |interest|
  pending #check if user has the correct interest
end

Then /^(?:|I )should not have an interest "([^"]*)"$/ do |interest|
  pending #check if user has the correct interest
end