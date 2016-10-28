Feature: edit team

  As a student
  So that I can work with people I like
  I want to be able to remove a user from my team
  
  Background:
    Given the following users exist
     | name  |       email                    | password   |team_passcode | major           | sid  |
 	 | Sahai | eecs666@hotmail.com            | mypassword | penguindrool | EECS            | 000  |
  	 | Jorge | legueoflegends667@hotmail.com  | password1  | penguindrool | Football Player | 999  |
 	
 	And I am on the login page
    And I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
 	
  Scenario: A user removes another user from their team
    Given I am on the team_index page
    And I press "remove_Jorge"
    Then I should see "Removed Jorge from team."

  Scenario: A user removes themself from the team using the Edit button
    Given I am on the team_index page
    And I press "remove_Sahai"
    Then I should be on the without_team page
    