Feature: Student can see group 
  As a student
  I want to see my group
  
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
    
  Scenario: Student successfully attempts to view their non-group
    Given I fill in "team_hash" with "penguindrool"
    And I press "Join"
    And I press "My Group"
    Then I should see "Your not in a group yet!"
    
#   Scenario: Student successfully attempts to view their non-group
#     Given I fill in "team_hash" with "penguindrool"
#     And I press "Join"
#     And I follow ""
#     And I follow "Submit Team"
#     Then I should see "Choose Discussions"

