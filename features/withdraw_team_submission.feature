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
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I log in as a user with email "eecs666@hotmail.com"

  Scenario: A user in a submitted team successfully withdraws that team's submission
  	Given my team is submitted
  	And I am on the home page
    When I press "Withdraw Team Submission"
    Then the team with passcode "penguindrool" should not be submitted
    
  Scenario: An approved team should not be able to change its status
    Given the team with passcode "penguindrool" is approved with discussion number "54321"
    Then I should not see "Withdraw Team Submission" button
    