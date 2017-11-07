Feature: Student can see group 
  As a student
  I want to see my group
  
  Background:
    Given the allowed team size is 3-4
    And the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
     | Jorge1 | kobe1@hotmail.com             | 0            | Football Player | 242  |
     | Jorge1 | kobe2@hotmail.com             | 0            | Football Player | 243  |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | hihi         | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | hihi         | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | hihi         | EECS            | 567  |
  	And the following discussions exist
  	 | number  | time         |  capacity |
  	 | 54321   | Tues, 3pm    |  24       |
  	And I am on the login page
  	
    
  Scenario: Student successfully attempts to view their non-group
    And I log in as a user with email "kobe1@hotmail.com"
    Given I fill in "team_hash" with "penguindrool"
    And I press "Join"
    And I press "My Group"
    Then I should see "Your not in a group yet!"
    
  Scenario: Student1 successfully views their group
    And I log in as a user with email "kobe1@hotmail.com"
    Given I fill in "team_hash" with "penguindrool"
    And I press "Join"
    And the team with passcode "penguindrool" is approved with discussion number "54321"
    And the team with passcode "hihi" is approved with discussion number "54321"
    And the following groups exist
     | team1_id |       team2_id    |discussion_id  |
     | 1        | 2                 | 1             |
    And I press "My Group"
    Then I should see "justanotheremail@aol.com"
    
  Scenario: Student2 successfully views their group
    And I log in as a user with email "kobe2@hotmail.com"
    Given I fill in "team_hash" with "hihi"
    And I press "Join"
    And the team with passcode "penguindrool" is approved with discussion number "54321"
    And the team with passcode "hihi" is approved with discussion number "54321"
    And the following groups exist
     | team1_id |       team2_id    |discussion_id  |
     | 1        | 2                 | 1             |
    And I press "My Group"
    Then I should see "justanotheremail@aol.com"



#   Background:
#     Given the allowed team size is 5-6
#     And   the following users exist
#      | name  | email                         | team_passcode | major           | sid |
#      | Jorge | legueoflegends667@hotmail.com | 0             | Football Player | 999 |
#      | Sahai | eecs666@hotmail.com           | penguindrool  | EECS            | 000 |
#      | Saha1 | eecs667@hotmail.com           | penguindrool  | EECS            | 001 |
#      | Saha2 | eecs668@hotmail.com           | penguindrool  | EECS            | 002 |
#      | Saha3 | eecs669@hotmail.com           | penguindrool  | EECS            | 003 |
#      | Saha4 | eecs660@hotmail.com           | penguindrool  | EECS            | 004 |

#     And I am on the login page
#     And I log in as a user with email "legueoflegends667@hotmail.com"

