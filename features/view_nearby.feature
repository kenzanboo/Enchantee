Feature: View Nearby Users
	In order to make new friends
	As a user
	I want to be able to see nearby users
	
	Scenario: View on map:
		Given I am logged in as bob	
		And my location is (37.8755647731171, -122.25864887237549)
		And there is a user joe with location (37.87546314788229, -122.25873470306396)
		And I am on the nearby users map
		Then there should be a point on the map at location (37.87546314788229, -122.25873470306396)
	
	Scenario: View as list:
		Given I am logged in as bob
		And my location is (37.8755647731171, -122.25864887237549)
		And there is a user joe with location (37.87546314788229, -122.25873470306396)
		And I am on the nearby users list
		Then I should see "joe"
	