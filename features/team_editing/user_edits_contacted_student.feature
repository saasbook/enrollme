Feature: A User approves student who has contacted team

  As a student
  So that I can approve students who has contacted the team
  So that I can only approve students who are not on another team

  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
 	   | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | anotherteam  | EECS            | 567  |
     | Ash   | pikachu@aol.com                | 0            | EECS            | 666  |

  	And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"
    And I am on the home page

  Scenario: A user adding another user who has contacted the team,
  and the added user should be on the team page
    Given I should not see "Ash" listed as a team member
    And I should not see "Ash" listed as a prospective member
    And "Ash" contacts the team
    And print page body
    Then I should see "Ash" listed as a prospective member
    And I should not see "Ash" listed as a team member
    When I press "add_Ash"
    Then I should see "Ash" listed as a team member
    And I should not see "Ash" listed as a prospective member

  Scenario: A user adding another user who has contacted team.
  This new user is on another team
    Given I should not see "Kandi" listed as a team member
    And I should not see "Kandi" listed as a prospective member
    And "Kandi" contacts the team
    Then I should not see "Kandi" listed as a prospective member
    And I should not see "Ash" listed as a team member