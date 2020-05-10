Feature: admin can view more information about teams

  As an administrator
  So that I can decide whether or not to approve a team
  I want to click on team IDs and User names to check out their information

  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  | skill
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | JS
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  | Backend
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  | Frontend
     | Saha4 | eecs669@hotmail.com            | penguindrool | EECS            | 003  | JS
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | CSS
  	And the following admins exist
  	 | name  | email                  |
  	 | Bob   | supreme_ruler@aol.com  |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
  	And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
  	And the team with passcode "penguindrool" is submitted
    And I follow "Pending"

  Scenario: An admin accesses a submitted team's page
  	Given I follow "1"
  	Then I should see "Team has been submitted!"
  	Then I should see "Selected Discussion Sections"

  Scenario: An admin accesses a user's information
    Given I follow "Sahai"
    Then I should see "SID: 000"
    And I should see "Major: EECS"
