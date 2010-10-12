Feature: View Profile
	In order to make new friends
	As a user
	I want to be able to see nearby users' profiles
	
	Scenario: View a Profile
		Given I am logged in with username "bob" and password "password"
		And my location is (37.8755647731171, -122.25864887237549)
		And there is a user named "joe" with location (37.87546314788229, -122.25873470306396)
		And joe's interests include "Surfing"
		When I am on joe's profile page
		Then I should see that joe's interests include "Surfing"
	