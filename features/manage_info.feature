Feature: Manage Info
	As a user
	I want to be able to manage my user info
	
	Scenario: Add Interests
		Given I am logged in as bob
		And I am on bob's add interest page
		When I fill in "name" with "Surfing"
		And I fill in "1" for "category"
		And I press "Create"
		Then I should have an interest "Surfing"
		And I should be on bob's show interests page
		
	Scenario: Display Interests
		Given I am logged in as bob
		And I have an interest "Surfing"
		When I go to bob's show interests page
		Then the "Interest" field should contain "Surfing"
		And the "Category" field should contain "Sports"
		
	Scenario: Edit Interests
		Given I am logged in as bob
		And I am on bob's edit interests page
		And I have an interest "Surfing"
		When I fill in "Interest" with "Baseball"
		And I fill in "Sports" for "Category"
		And I press "Submit"
		Then I should have an interest "Baseball"
		And I should not have an interest "Surfing"
		And I should be on bob's show interests page
	
	Scenario: Edit Name
		Given I am logged in as bob
		And I am on bob's edit info page
		And the field "Name" contains the text "Bob"
		When I enter "Billy Bob" into the "Name" field
		And I submit the form
		Then My name should be "Billy Bob"
	
		