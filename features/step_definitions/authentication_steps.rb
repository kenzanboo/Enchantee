Given /^(?:|I )am logged in as (.+)$/ do |username|
  user = create_user(username, 'supersecret')
  visit login_path
  fill_in :username, :with => username
  fill_in :password, :with => 'supersecret'
  click_button "Login"
end