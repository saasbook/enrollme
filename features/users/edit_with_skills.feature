Feature: edit user information (with skills)
  As a student
  I want to be able to change my skills after sign up
  So that I can add skills I forgot to add or remove skills that are not applicable to me

  Background:
    Given the following users exist
     | name    |       email          |team_passcode | major | sid  |
 	   | Sahai   | eecs666@hotmail.com  | penguindrool | EECS  | 000  |
   	And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"
    And I am on the team "1" page

  Scenario: An existing user edits their information
    Given I should not see "NewName"
    And I should see "Sahai"
    When I follow "My Info"
    And I follow "Edit"
    And I fill in "Skills" with "Frontend"
    And I press "Update Information"
    Then I should see "NewName"

  Scenario: A user cancels editing their information
    Given I should see "Sahai"
    When I follow "My Info"
    And I follow "Edit"
    And I follow "Cancel"
    Then I should see "Sahai"
