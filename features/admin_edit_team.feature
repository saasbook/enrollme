Feature: An admin edits a team

  As an admin
  So that I can keep student enrollment records consistent
  I want to be able to remove a user from any team
  
  Background:
    Given the following users exist
     | name  |       email                    | password   |team_passcode | major           | sid  |
 	 | Sahai | eecs666@hotmail.com            | mypassword | penguindrool | EECS            | 000  |
  	 | Jorge | legueoflegends667@hotmail.com  | password1  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | myname555  | anotherteam  | EECS            | 567  |
    And the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I log in as an admin with email "supreme_ruler@aol.com"
    And I am on the team "1" page

  Scenario: An admin successfully removes a user from an unsubmitted team
    Given pending: the team with passcode "penguindrool" is not submitted
    And pending: the team with passcode "penguindrool" is not approved
    When pending: I press "remove_Jorge"
    Then pending: I should see "Removed Jorge from team."

  Scenario: pending: An admin successfully removes a user from an submitted team
    Given pending: the team with passcode "penguindrool" is submitted
    And pending: the team with passcode "penguindrool" is not approved
    When pending: I press "remove_Jorge"
    Then pending: I should see "Removed Jorge from team."
    And pending: the team with passcode "penguindrool" should not be submitted

  Scenario: An admin successfully removes a user from an approved team
    Given pending: the team with passcode "penguindrool" is approved with discussion number "54321"
    When pending:  I press "remove_Jorge"
    Then pending: I should see "Removed Jorge from team."
    And pending: the team with passcode "penguindrool" should not be approved
    And pending: the team with passcode "penguindrool" should not be submitted
  