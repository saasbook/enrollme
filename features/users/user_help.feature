Feature: Student gets help 
  As a student
  I want to get help on how to use this website as a student
  I want to click a button that brings me to an info page
  
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
    And I log in as a user with email "legueoflegends667@hotmail.com"

  Scenario: User successfully finds help and returns to main page
    When PENDING: I press "Help"
    Then I should see "EnrollMe Tutorial and Help"
    When I press "Back"
    Then I should see "My Team"

