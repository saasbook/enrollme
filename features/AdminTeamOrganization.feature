Feature: Use an admin acccount to see organized team data
    
  
  Background:
    Given the following admins exist
     | name | email                  |
  	 | Bob  | supreme_ruler@aol.com  |
    And the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: See organized data and aprove or not 
    Given I should see "Team ID"
    Then I should see "Members"
    Then I should see "Status"
    
  Scenario: change from disaprove to approve a team
    Given the team with passcode "penguindrool" is approved with discussion number "54321"
    And I follow "disapprove_1"
    And I follow "Approved"
    Then I should not see "Sahai"

  Scenario: approve a team
    Given the team with passcode "penguindrool" is submitted
    And I follow "approve_1"
    And I follow "Approved"
    Then I should see "Sahai"