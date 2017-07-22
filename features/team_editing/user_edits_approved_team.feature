Feature: Users cannot edit an approved team

  As a student and a member of an approved team
  So that I know the final members of my team for CS 169
  I want to ensure that members of my team can not leave and others cannot join
  
  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  | waitlisted |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | Yes |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  | Yes |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  | Yes |
     | Saha4 | eecs669@hotmail.com            | penguindrool | EECS            | 003  | Yes |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | Yes |
  	 | Kandi | justanotheremail@aol.com       | 0            | EECS            | 567  | Yes |
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
