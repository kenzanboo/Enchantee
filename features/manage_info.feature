Feature: Manage Info
	As a user
	I want to be able to manage my user info
	
	Scenario: Edit Name
		Given I am logged in as bob
		And I am on bob's edit page
		And the field "Name" contains the text "Bob"
		When I enter "Billy Bob" into the "Name" field
		And I submit the form
		Then My name should be "Billy Bob"
	
		