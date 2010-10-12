Feature: Manage Info
	As a user
	I want to be able to manage my user info
	
	Scenario: Add Interests
		Given I am logged in as user "bob" with password "password"
		And I am on the edit info page
		When I enter "Surfing" into the "Interest" field
		And I click the "Add Interest"
		Then my interests should include "Surfing"
	
	Scenario: Edit Name
		Given I am logged in as user "bob" with password "password"
		And I am on the edit info page
		And the field "Name" contains the text "Bob"
		When I enter "Billy Bob" into the "Name" field
		And I submit the form
		Then My name should be "Billy Bob"
	
		