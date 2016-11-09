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
    And PENDING: I log in with email "eecs666@hotmail.com"
  	And PENDING: I submit my team
 	
  Scenario: A user removing another user from a submitted team resets that team's submission status
    When PENDING: I remove "Jorge"
    Then PENDING: my team is not submitted

  Scenario: A user leaving a submitted team resets that team's submission status
    When PENDING: I leave my team
    # TODO : remember in the "log in" step to add a "log out if logged in" check step
    And PENDING: I log in with email "eecs667@hotmail.com"
    Then PENDING: my team is not submitted

  Scenario: A user joining a submitted team resets that team's submission status
    When PENDING: I log in with email "justanotheremail@aol.com"
    And PENDING: I join a team with passcode "penguindrool"
    Then PENDING: my team is not submitted
