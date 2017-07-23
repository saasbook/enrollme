Feature: display team members' information
  As a student
  In order to know team members well
  I want to see team members' profile
  
  
Background:
  Given the following users exist
  
       |   name    |       email       |team_passcode | major        |       sid      | waitlisted |team_id| bio |
  	   | Jorge     |    legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | Yes | 1 |Jorge's bio|
 	   | Sahai     | eecs666@hotmail.com        | penguindrool | EECS            | 000  | Yes | 1 |Sahai's bio|
 	   | Saha1     | eecs667@hotmail.com        | penguindrool | EECS            | 001  | Yes | 1 |Saha1's bio|
 	   | Saha2     | eecs668@hotmail.com        | penguindrool | EECS            | 002  | Yes | 1 |Saha2's bio|
 	   | Saha3     | eecs669@hotmail.com        | teampass | EECS            | 003  | Yes | 2 |Saha3's bio|
 	   | Saha4     | eecs660@hotmail.com        | teampass | EECS            | 004  | Yes | 2 |Saha4's bio|


    And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"

    # Scenario: User successfully goes to team info page from team list page
    #   Given I am on the team list page
    #   When I go to the team info page for team_id "2"
    #   Then I should see "Saha3"
    #   And I should see "Saha4's bio"
    #   And I should not see "Jorge"
    
    Scenario: User successfully views a team's info
      Given I am on the team info page for team_id "2"
      Then I should see "Saha3"
      And I should see "Saha4's bio"
      And I should not see "Jorge"