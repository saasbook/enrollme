Feature: editing a team is impossible after approval

  As a student and a member of an approved team
  So that I know the final members of my team for CS 169
  I want to ensure that members of my team can not leave and others cannot join
  
  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | 0            | EECS            | 567  |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
  	And the team with passcode "penguindrool" is approved with discussion number "54321"
  	And I am on the login page

  Scenario: A user cannot remove another user from an approved team
    Given I log in as a user with email "eecs666@hotmail.com"
    And I remove "Jorge"
    Then I should see "Permission denied"

  Scenario: A user cannot remove themselves from an approved team
    Given I log in as a user with email "eecs666@hotmail.com"
    And I leave my team
    Then I should see "Permission denied"
    And I should see "My Team"

  Scenario: A user cannot join an approved team
    When I log in as a user with email "justanotheremail@aol.com"
    And I join a team with passcode "penguindrool"
    Then I should see "Unable to join team"
    And I should be on the without_team page
