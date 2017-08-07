@javascript
Feature: Student gets help
  As a student
  I want to get help on how to use this website as a student
  I want to click a button that brings me to an info page
  
  Background:
        Given the following users exist
     |   name    |       email       |team_passcode | major        |       sid      | waitlisted |
  	 | Jorge    |    legueoflegends667@hotmail.com  | 0 | Football Player | 999  | true |
 	   | Sahai     | eecs666@hotmail.com        | penguindrool | EECS            | 000  | true |
 	   | Saha1     | eecs667@hotmail.com        | penguindrool | EECS            | 001  | true |
 	   | Saha2     | eecs668@hotmail.com        | penguindrool | EECS            | 002  | true |
 	   | Saha3     | eecs669@hotmail.com        | penguindrool | EECS            | 003  | true |
 	   | Saha4     | eecs660@hotmail.com        | penguindrool | EECS            | 004  | true |

    And I am on the login page
    And I log in as a user with email "legueoflegends667@hotmail.com"

  Scenario: User successfully finds help
    When I follow "Help"
    Then I should see "Student Help"

