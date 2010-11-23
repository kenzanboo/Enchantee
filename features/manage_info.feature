Feature: Manage Info
	As a user
	I want to be able to manage my user info
	
	Scenario: Edit Name
		Given I am logged in as bob
		And I am on bob's edit page
		When I fill in "Billy Bob" for "First name"
		And I press "Update"
		Then I should have the name "Billy Bob"
	
		