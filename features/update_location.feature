Feature: Update Location
	As a user
	I want to be able to update my location
	
	Scenario: Add Interests
		Given I am logged in as Alice
		And I am on Alice's update_location page
		And I fill in "10.000" for "latitude"
		And I fill in "20.000" for "longitude"
		And I press "Update_location"
		Then I should have a latitude "10.000"
		Then I should have a longitude "20.000"