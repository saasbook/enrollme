Feature: join or create a team

  As a student
  So that I can become part of a team
  I want to be able to join or create a team
  
  Background:
    Given PENDING: the following users exist
     |   name    |       email        | SID        |       major      |
  	 | Jorge                  | Football Player | 999  | legueoflegends667@hotmail.com |
 	   | Sahai                  | EECS            | 000  | eecs666@hotmail.com			  |
    And PENDING: I am on the home page
    
  Scenario: An existing user creates a new team and gets the password
    Given PENDING: I am logged in as "Jorge"
    When PENDING: I follow "Create"
    Then PENDING: I should be on my team page
    And PENDING: I should see "Team Password"
    And PENDING: I should see "Jorge"
    And PENDING: I should not see "Sahai"
    
  Scenario: An existing user joins an existing team
    Given PENDING: I am logged in as "Jorge"
    And PENDING: There is a team with password "12345"
    And PENDING: I fill in "Team Hash" with "12345"
    And PENDING: I press "Join"
    Then PENDING: I should see "Your Team Password is 12345"
    