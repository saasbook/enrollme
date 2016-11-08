Feature: editing a team is impossible after approval

  As a student and a member of an approved team
  So that I know the final members of my team for CS 169
  I want to ensure that members of my team can not leave and others cannot join
  
  Background:
    Given the following users exist
     | name  |       email                    | password   |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | mypassword | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | mypassword | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | mypassword | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | mypassword | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | password1  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | myname555  | 0            | EECS            | 567  |
  	And PENDING: the team with passcode "penguindrool" is approved

  Scenario: A user cannot remove another user from an approved team
    Given PENDING: I log in with email "eecs666@hotmail.com"
    And PENDING: I remove "Jorge"
    Then PENDING: I should see "Unable to remove Jorge"

  Scenario: A user cannot remove themselves from an approved team
    Given PENDING: I log in with email "eecs666@hotmail.com"
    And PENDING: I leave my team
    Then PENDING: I should see "Unable to leave team"
    And PENDING: I should be on my team page

  Scenario: A user cannot join an approved team
    When PENDING: I log in with email "justanotheremail@aol.com"
    And PENDING: I join a team with passcode "penguindrool"
    Then PENDING: I should see "Unable to join team"
