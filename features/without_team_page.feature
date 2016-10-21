Feature: join or create a team

  As a student
  So that I can become part of a team
  I want to be able to join or create a team
  
  Background:
    Given the following users exist
     |   name    |       email       |password |team | major        |       sid      |
  	 | Jorge    |    legueoflegends667@hotmail.com  | password1 | 0 | Football Player | 999  |
 	   | Sahai     | eecs666@hotmail.com        | mypassword     | 1 | EECS            | 000  |

    And I am on the login page
    
  Scenario: An existing user creates a new team and gets the password
    Given I fill in "Email" with "legueoflegends667@hotmail.com"
    And I fill in "Password" with "password1"

    And I press "Log In"
    Then I should see "Create or Join a Team"
    And I press "Create"
    And I should see "Team Password:"
    
  Scenario: An existing user joins an existing team
    Given I fill in "Email" with "legueoflegends667@hotmail.com"
    And a team exists
    And I fill in "Password" with "password1"
    And I press "Log In"
    And I fill in "team_hash" with "1"
    And I press "Join"
    Then I should be on the Team "1" page
    