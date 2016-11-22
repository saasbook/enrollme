Feature: A user can edit their profile

  As a student
  So that I can update any personal information changes
  I want to be able to change my personal information
  
  Background:
    Given the following users exist
     |   name    |       email          |team_passcode | major | sid  |
 	   |  Sid      | eecs666@hotmail.com  | 1            | EECS  | 000  |
    And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"

  Scenario: Successfully edit my account information
    Given I follow "Edit My Info"
    And I fill in "Name" with "MasihxxSidxxMasih"
    And I press "Update Information"
    Then I should see "MasihxxSidxxMasih"
    