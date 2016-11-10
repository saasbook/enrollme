Feature: editing a team changes its submission status

  As a student and a member of a submitted team
  So that I have the freedom to edit the members on my team
  I want to modify my team submission before it gets approved
  
  Background:
    Given the following users exist
     | name  |       email                    | password   |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | mypassword | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | mypassword | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | mypassword | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | mypassword | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | password1  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | myname555  | 0            | EECS            | 567  |
    And I log in as a user with email "eecs666@hotmail.com"
  	And the team with passcode "penguindrool" is submitted
 	
  Scenario: A user removing another user from a submitted team resets that team's submission status
    When I remove "Jorge"
    Then the team with passcode "penguindrool" should not be submitted

  Scenario: A user leaving a submitted team resets that team's submission status
    When I leave my team
    And I log out
    And I log in as a user with email "eecs667@hotmail.com"
    Then the team with passcode "penguindrool" should not be submitted

  Scenario: A user joining a submitted team resets that team's submission status
    Given I log out
    When I log in as a user with email "justanotheremail@aol.com"
    And I join a team with passcode "penguindrool"
    Then the team with passcode "penguindrool" should not be submitted
