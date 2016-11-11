Feature: A User edits their team

  As a student
  So that I can work with people I like
  I want to be able to remove a user from my team
  
  Background:
    Given the following users exist
     | name  |       email                    | password   |team_passcode | major           | sid  |
 	   | Sahai | eecs666@hotmail.com            | mypassword | penguindrool | EECS            | 000  |
  	 | Jorge | legueoflegends667@hotmail.com  | password1  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | myname555  | anotherteam  | EECS            | 567  |
    And I log in as a user with email "eecs666@hotmail.com"
    And I am on the team_index page
 	
  Scenario: A user removes another user from their team
    When I press "remove_Jorge"
    Then I should see "Removed Jorge from team."

  Scenario: A user removes themself from the team using the Edit button
    When I press "remove_Sahai"
    Then I should be on the without_team page
    
  Scenario: A user fails removal of a user not on their own team
    When I go to the removal page for "Kandi"
    Then I should see "Removal failed"
