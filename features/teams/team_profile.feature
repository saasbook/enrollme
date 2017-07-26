Feature: display team members' profile
  As a student
  In order to know team members well
  I want to see team members' profile
  
  
Background:
  Given the following users exist
  
     |   name    |       email       |team_passcode | major        |       sid      | waitlisted |team_id| bio |
  	 | Jorge     |    legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | true | 9 |Jorge's bio|
 	   | Sahai     | eecs666@hotmail.com        | penguindrool | EECS            | 000  | true | 9 |Sahai's bio|
 	   | Saha1     | eecs667@hotmail.com        | penguindrool | EECS            | 001  | true | 9 |Saha1's bio|
 	   | Saha2     | eecs668@hotmail.com        | penguindrool | EECS            | 002  | true | 9 |Saha2's bio|
 	   | Saha3     | eecs669@hotmail.com        | teampass | EECS            | 003  | true | 5 |Saha3's bio|
 	   | Saha4     | eecs660@hotmail.com        | teampass | EECS            | 004  | true | 5 |Saha4's bio|


    And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"

    # Scenario: User successfully goes to team info page from team list page
    #   Given I am on the team list page
    #   When I go to the team info page for team_id "2"
    #   Then I should see "Saha3"
    #   And I should see "Saha4's bio"
    #   And I should not see "Jorge"
    
    Scenario: User successfully views a team's profile
      Given I am on the team profile page for team_id "5"
      Then I should see "Saha3"
      And I should not see "Jorge"