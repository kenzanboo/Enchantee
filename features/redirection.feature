Feature: Redirection
    In order to do anything productive
    As a user
    I want to see the welcome page
    
    Scenario: Visit the root path when I'm not logged in
        Given I am logged out
        And I go to the root page
        Then I should be on the welcome page
        
    Scenario: Visit the root path when I'm logged in
        Given I am logged in as bob
        And I go to the root page
        Then I should be on the home page