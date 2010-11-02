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
	
	Scenario: Sign Up
		Given I am on the signup page
		When I sign up with username "bob", password "password", first name "Billy", and last name "Bob"
		Then there should be a user with username "bob", password "password", first name "Billy", and last name "Bob"
