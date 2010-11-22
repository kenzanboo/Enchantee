Feature: User Bookmarking
	In order to keep track of acquaintances
	As a user
	I want to be able to bookmark other users
	
	Scenario: Bookmark a user
		Given I am logged in with username "bill" and password "password"
		And There is a user with username "bob" and password "password"
		And I am on the show user page for bob
		When I click "Bookmark User"
		And I go to my profile
		Then I should see "bob"
	
	Scenario: Remove a user from bookmarks
		Given I am logged in with username "bill" and password "password"
		And there is a user with username "bob" and password "password"
		And I have bookmarked bob
		And I am on my profile
		When I click "Remove"
		And I go to my profile
		Then I should not see "bob"