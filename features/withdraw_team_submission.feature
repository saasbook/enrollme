Feature: unsubmit a team

  As a student and a member of a submitted team
  So that I can make changes to my team
  I want to ensure that I can change my team status before approval
  
  Background:
    Given the following users exist
     | name  |       email                    | password   |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | mypassword | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | mypassword | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | mypassword | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | mypassword | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | password1  | penguindrool | Football Player | 999  |
    And PENDING: I log in with email "eecs666@hotmail.com"

  Scenario: A user in a submitted team successfully withdraws that team's submission
  	Given PENDING: the team with passcode "penguindrool" is submitted
    When PENDING: I press "Withdraw Team Submission"
    Then PENDING: my team is not submitted
    
  Scenario: An approved team should not be able to change its status
    Given PENDING: the team with passcode "penguindrool" is approved
    Then PENDING: I should not see the button "Withdraw Team Submission"
    