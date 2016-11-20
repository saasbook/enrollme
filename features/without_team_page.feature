Feature: join or create a team

  As a student
  So that I can become part of a team
  I want to be able to join or create a team
  
  Background:
    Given the following users exist
     |   name    |       email       |team_passcode | major        |       sid      |
  	 | Jorge    |    legueoflegends667@hotmail.com  | 0 | Football Player | 999  |
 	   | Sahai     | eecs666@hotmail.com        | penguindrool | EECS            | 000  |
 	   | Saha1     | eecs667@hotmail.com        | penguindrool | EECS            | 001  |
 	   | Saha2     | eecs668@hotmail.com        | penguindrool | EECS            | 002  |
 	   | Saha3     | eecs669@hotmail.com        | penguindrool | EECS            | 003  |
 	   | Saha4     | eecs660@hotmail.com        | penguindrool | EECS            | 004  |

    And I am on the login page
    
  Scenario: I type in a bad password and the website freaks out
    Given I log in as a user with email "legueoflegends667@hotmail.com"
    And I should see "Create or Join a Team"
    And I fill in "team_hash" with "barbequed_crickets"
    And I press "Join"
    Then I should see "Unable to join team"
    
  Scenario: An existing user creates a new team and gets the password
    Given I log in as a user with email "legueoflegends667@hotmail.com"
    Then I should see "Create or Join a Team"
    And I press "Create"
    And I should see "Team Password:"
    
  Scenario: An existing user joins an existing team
    Given I log in as a user with email "legueoflegends667@hotmail.com"
    And I fill in "team_hash" with "penguindrool"
    And I press "Join"
    Then I should see "Team Password: penguindrool"