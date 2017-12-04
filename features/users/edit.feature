Feature: edit user information

  As a student
  So that I can fix any mistakes I made in inputting information
  I want to be able to edit my user information

  Background:
    Given the following users exist
     | name    |       email          |team_passcode | major | sid  | skill |
 	   | Sahai   | eecs666@hotmail.com  | penguindrool | EECS  | 000  | Backend |
    Given the following skills exist
     | name    |
     | Frontend   |
   	And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"
    And I follow "My Info"
    And I should see "Backend"

  Scenario: An existing user edits their information
    Given I should not see "NewName"
    And I should see "Sahai"
    And I follow "Edit"
    And I fill in "Name" with "NewName"
    And I check "Frontend"
    And I press "Update Information"
    Then I should see "NewName"
    And I should see "Frontend"

  Scenario: A user cancels editing their information
    Given I should see "Sahai"
    And I follow "Edit"
    And I follow "Cancel"
    Then I should see "Sahai"
