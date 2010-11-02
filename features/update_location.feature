Feature: Update Location
	As a user
	I want to be able to update my location
	
	Scenario: Add Interests
		Given I am logged in as Alice
		And I am on Alice's update_location page
		And I fill in "10.000" for "user_latitude"
		And I fill in "20.000" for "user_longitude"
		And I press "Update_location"
		Then "Alice" should have a latitude "10.000"
		Then "Alice" should have a longitude "20.000"