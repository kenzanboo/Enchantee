Feature: Authentication
	In order to identify users
	As a security-minded programmer
	I want to authenticate users
	
	Scenario: Successful Login
		Given there is a user with username "bob" and password "password"
		And I am on the login page
		When I log in with username "bob" and password "password"
		Then I should be logged in
	
	Scenario: Unsuccessful Login
		Given I am on the login page
		When I log in with username "invalidUserName3837263" and password "invalidPassword3453425"
		Then I should be on the user_session page

	
	Scenario: Sign Up
		Given I am logged out
		And I am on the signup page	
		When I sign up with username "bob", password "password", first name "Billy", and last name "Bob"
		Then there should be a user with username "bob", password "password", first name "Billy", and last name "Bob"
