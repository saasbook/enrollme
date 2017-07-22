Feature: display team members' information
  As a student
  In order to know team members well
  I want to see team members' profile
  
  
Background:
  Given the following users exist
  
       |   name    |       email       |team_passcode | major        |       sid      | waitlisted |team_id|
  	   | Jorge     |    legueoflegends667@hotmail.com  | 0 | Football Player | 999  | Yes | 1 |
 	   | Sahai     | eecs666@hotmail.com        | penguindrool | EECS            | 000  | Yes | 2 |
 	   | Saha1     | eecs667@hotmail.com        | penguindrool | EECS            | 001  | Yes | 2 |
 	   | Saha2     | eecs668@hotmail.com        | penguindrool | EECS            | 002  | Yes | 2 |
 	   | Saha3     | eecs669@hotmail.com        | penguindrool | EECS            | 003  | Yes | 2 |
 	   | Saha4     | eecs660@hotmail.com        | penguindrool | EECS            | 004  | Yes | 2 |


    And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"

    Scenario: User successfully goes to team info page
      Given I am on the team list page
      When I follow 
    
    Scenario: Users see the team members' names
      