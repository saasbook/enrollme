Feature: join or create a team

  As a student
  So that I can become part of a team
  I want to be able to join or create a team
  
  Background:
    Given the allowed team size is 5-6
    And   the following users exist
     | name  | email                         | team_passcode | major           | sid |
     | Jorge | legueoflegends667@hotmail.com | 0             | Football Player | 999 |
     | Sahai | eecs666@hotmail.com           | penguindrool  | EECS            | 000 |
     | Saha1 | eecs667@hotmail.com           | penguindrool  | EECS            | 001 |
     | Saha2 | eecs668@hotmail.com           | penguindrool  | EECS            | 002 |
     | Saha3 | eecs669@hotmail.com           | penguindrool  | EECS            | 003 |
     | Saha4 | eecs660@hotmail.com           | penguindrool  | EECS            | 004 |

    And I am on the login page
    And I log in as a user with email "legueoflegends667@hotmail.com"
    
  Scenario: A user tries joining a nonexistent team
    Given I fill in "team_hash" with "barbequed_crickets"
    And I press "Join"
    Then I should see "Unable to join team"
    
  Scenario: An existing user creates a new team and gets the password
    Given I press "Create"
    Then I should see "Team Password:"
    
  Scenario: An existing user joins an existing team
    Given I fill in "team_hash" with "penguindrool"
    And I press "Join"
    Then I should see "Team Password: penguindrool"
