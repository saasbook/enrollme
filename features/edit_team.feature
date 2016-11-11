Feature: edit team

  As a student
  So that I can work with people I like
  I want to be able to remove a user from my team
  
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
 	
  Scenario: A user removes another user from their team
    Given I log in as a user with email "eecs666@hotmail.com"
    And I am on the team_index page
    And I press "remove_Jorge"
    Then I should see "Removed Jorge from team."

  Scenario: A user removes themself from the team using the Edit button
    Given I log in as a user with email "eecs666@hotmail.com"
    And I am on the team_index page
    And I press "remove_Sahai"
    Then I should be on the without_team page
    And PENDING: Team "penguindrool" should not exist
    
  Scenario: A user fails removal of a user not on their own team
    Given I log in as a user with email "eecs666@hotmail.com"
    And I am on the team_index page
    And I go to the removal page for "Kandi"
    Then I should see "Removal failed"
    
  Scenario: An admin successfully removes a user from an unsubmitted team
    Given I log in as an admin with email "supreme_ruler@aol.com"
    And PENDING: I am on the team page with passcode "penguindrool"
    When I press "remove_Jorge"
    Then I should see "Removed Jorge from team."

  Scenario: An admin successfully removes a user from an submitted team
    Given I log in as an admin with email "supreme_ruler@aol.com"
    And the team with passcode "penguindrool" is submitted
    And PENDING: I am on the team page with passcode "penguindrool"
    When I press "remove_Jorge"
    Then I should see "Removed Jorge from team."
    And the team with passcode "penguindrool" should not be submitted

  Scenario: An admin successfully removes a user from an approved team
    Given I log in as an admin with email "supreme_ruler@aol.com"
    And the team with passcode "penguindrool" is approved with discussion number "54321"
    And PENDING: I am on the team page with passcode "penguindrool"
    When I press "remove_Jorge"
    Then I should see "Removed Jorge from team."
    And the team with passcode "penguindrool" should not be approved
    And the team with passcode "penguindrool" should not be submitted
  