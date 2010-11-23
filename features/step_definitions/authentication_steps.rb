Given /^(?:|I )am logged in as (.+)$/ do |username|
  @user = create_user(username, 'supersecret')
  visit login_path
  fill_in :username, :with => username
  fill_in :password, :with => 'supersecret'
  click_button "Login"
end

Given /^there is a user with username "([^"]*)" and password "([^"]*)"$/ do |name, pass|
  @user = create_user(name, pass)
end

Given /^I am not logged in$/ do
  visit logout_path
end

When /^I log in with username "([^"]*)" and password "([^"]*)"$/ do |name, pass|
  visit login_path
  fill_in :username, :with => name
  fill_in :password, :with => pass
  click_button "Login"
end

When /^I sign up with username "([^"]*)", password "([^"]*)", first name "([^"]*)", and last name "([^"]*)"$/ do |user, pass, first, last|
  fill_in :username, :with => name
  fill_in :password, :with => pass
  fill_in "Password confirmation", :with => pass
  fill_in "First name", :with => first
  fill_in "Last name", :with => last
  click_button "Create"
end

Then /^there should be a user with username "([^"]*)", password "([^"]*)", first name "([^"]*)", and last name "([^"]*)"$/ do |user, pass, first, last|
  User.find_by_username_and_first_name_and_last_name(user, first, last)
end


Then /^I should be logged in$/ do
  @current_user != nil
end