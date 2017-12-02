Feature: A User edits their team

  As a student
  So that I can work with people I like
  I want to be able to remove a user from my team

  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
 	   | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | anotherteam  | EECS            | 567  |
  	And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"
    And I am on the home page

  Scenario: A user removes another user from their team
    When I remove "Jorge"
    Then I should see "Removed Jorge from team."

  Scenario: A user removes themself from the team using the Edit button
    When I remove "Sahai"
    Then I should be on the without_team page

  Scenario: A user removes everyone from the team
    When I press "remove_Jorge"
    And I press "remove_Sahai"
    Then I should be on the without_team page
    And the team with passcode "penguindrool" should not exist

  Scenario: A user fails removal of a user not on their own team
    When I go to the removal page for "Kandi"
    Then I should see "Permission denied"

  Scenario: A user adding another user who had contacted the team,
  and the added user should be on the team page
    Given "Kandi" contacts the team
    Then I should see "Kandi" listed as a prospective member
    And I should not see "Kandi" listed as a team member
    When I press "add_Kandi"
    Then I should see "Kandi" listed as a team member
    And I should not see "Kandi" listed as a prospective member
