Feature: Email all students on a team with one button.

  As an admin
  So that I can easily email all team members
  I want to be able to click one button and send an e-mail to everyone on a team

  Background:
    Given the following admins exist
     | name | email                  |
  	 | Bob  | supreme_ruler@aol.com  |
    And the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
    
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    And I am on the team "1" page
    
    Scenario: I should send an e-mail to all team members with one click
      Given I press "E-Mail Team"
      Then "eecs666@hotmail.com" should receive 1 email
      And "eecs667@hotmail.com" should receive 1 email
      And "eecs668@hotmail.com" should receive 1 email
      And "legueoflegends667@hotmail.com" should receive 1 email