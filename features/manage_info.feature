Feature: Manage Info
	As a user
	I want to be able to manage my user info
	
	Scenario: Add Interests
		Given I am logged in as user "bob" with password "password"
		And I am on edit_info
		When I fill in "Interest" with "Surfing"
		And I fill in "Sports" for "Category"
		And I press "Update"
		Then I should have an interest "Surfing"
		And I should be on edit_info
		
	Scenario: Display Interests
		Given I am logged in as user "bob" with password "password"
		And I have an interest "Surfing"
		When I go to edit_info
		Then the "Interest" field should contain "Surfing"
		And the "Category" field should contain "Sports"
		
	Scenario: Edit Interests
		Given I am logged in as user "bob" with password "password"
		And I am on the edit info page
		And I have an interest "Surfing"
		When I fill in "Interest" with "Baseball"
		And I fill in "Sports" for "Category"
		And I press "Update"
		Then I should have an interest "Baseball"
		And I should not have an interest "Surfing"
		And I should be on edit_info		
	
	Scenario: Edit Name
		Given I am logged in as user "bob" with password "password"
		And I am on the edit info page
		And the field "Name" contains the text "Bob"
		When I enter "Billy Bob" into the "Name" field
		And I submit the form
		Then My name should be "Billy Bob"
	
		