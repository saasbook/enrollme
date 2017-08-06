Feature: An admin edits a team

  As an admin
  So that I can keep student enrollment records consistent
  I want to be able to remove a user from any team
  
  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  | waitlisted |
 	 | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | true |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | true |
  	 | Kandi | justanotheremail@aol.com       | anotherteam  | EECS            | 567  | true |
    And the following admins exist
      | name | email                  |
  	  | Bob  | supreme_ruler@aol.com  |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
#    And I am on the team "1" page
    Then show me the page
    And I follow "1"

  Scenario: An admin successfully removes a user from an unsubmitted team
    Given the team with passcode "penguindrool" is not submitted
    And the team with passcode "penguindrool" is not approved
    When I press "remove_Jorge"
    Then I should see "Removed Jorge from team."

  Scenario: An admin successfully removes a user from an submitted team
    Given the team with passcode "penguindrool" is submitted
    And the team with passcode "penguindrool" is not approved
    When I press "remove_Jorge"
    Then I should see "Removed Jorge from team."
    And the team with passcode "penguindrool" should not be submitted

  Scenario: An admin successfully removes a user from an approved team
    Given the team with passcode "penguindrool" is approved with discussion number "54321"
    When I press "remove_Jorge"
    Then I should see "Removed Jorge from team."
    And the team with passcode "penguindrool" should not be approved
    And the team with passcode "penguindrool" should not be submitted
  