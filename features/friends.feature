Feature: User Bookmarking
	In order to keep track of acquaintances
	As a user
	I want to be able to bookmark other users
	
	Scenario: Bookmark a user
		Given I am logged in as bill
		And there is a user with username "bob" and password "password"
		And I am on the show user page for bob
		When I follow "Bookmark User"
		And I go to the show user page for bill
		Then I should see "bob"
	
	Scenario: Remove a user from bookmarks
		Given I am logged in as bill
		And there is a user with username "bob" and password "password"
		And bill has bookmarked bob
		And I am on the show user page for bill
		When I follow "Remove"
		And I go to the show user page for bill
		Then I should not see "bob"
	
	Scenario: Fail to remove a friend from another user
		Given I am logged in as bill
		And there is a user with username "bob" and password "password"
		And there is a user with username "joe" and password "secret"
		And bob has bookmarked joe
		When I am on the show user page for bob
		Then I should see "joe"
		And I should not see "Remove"
	
	Scenario: Fail to add a user to friends more than once
		Given I am logged in as bill
		And there is a user with username "bob" and password "password"
		And bill has bookmarked bob
		When I am on the show user page for bob
		Then I should not see "Bookmark User"
	
	Scenario: Fail to add a user to his own bookmarks
		Given I am logged in as bill
		When I am on the show user page for bill
		Then I should not see "Bookmark User"