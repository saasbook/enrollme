Feature: admin can view more information about teams

  As an administrator
  So that I can decide whether or not to approve a team
  I want to click on team IDs and User names to check out their information
  
  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
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
  	Given PENDING: I follow "1"
  	Then PENDING: I should see "Team has been submitted!"
  	Then PENDING: I should see "Selected Discussion Sections:"
  	
  Scenario: An admin accesses a user's information
    Given PENDING: I follow "Sahai"
    Then PENDING: I should see "SID: 000"
    And PENDING: I should see "Major: EECS"
    