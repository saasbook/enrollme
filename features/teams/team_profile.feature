@javascript
Feature: display team members' profile
  As a student
  In order to know team members well
  I want to see team members' profile
  
  
Background:
  Given the following users exist
  
     |   name    |       email       |team_passcode | major        |       sid      | waitlisted | bio |
  	 | Jorge     |    legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | true |Jorge's bio|
 	   | Sahai     | eecs666@hotmail.com        | penguindrool | EECS            | 000  | true |Sahai's bio|
 	   | Saha1     | eecs667@hotmail.com        | penguindrool | EECS            | 001  | true |Saha1's bio|
 	   | Saha2     | eecs668@hotmail.com        | penguindrool | EECS            | 002  | true |Saha2's bio|
 	   | Saha3     | eecs669@hotmail.com        | teampass | EECS            | 003  | true |Saha3's bio|
 	   | Saha4     | eecs660@hotmail.com        | teampass | EECS            | 004  | true |Saha4's bio|

    And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"

    Scenario: User successfully goes to team info page from team list page
       Given I am on the team list page
       When I follow "Saha3, Saha4"
       Then I should see "Saha3"
       And I should see "Saha4"
       And I should not see "Jorge"
    
    Scenario: User successfully views a team's profile
      Given I am on the team "1" page
      Then I should see "Jorge"
      And I should not see "Saha3"