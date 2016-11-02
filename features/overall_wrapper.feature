Feature: A user can edit their profile

  As a student
  So that I can update any personal information changes
  I want to be able to change my personal information
  
  Background:
    Given the following users exist
     |   name    |       email          | password   |team_passcode | major | sid  |
 	   |  Sid      | eecs666@hotmail.com  | mypassword | 1            | EECS  | 000  |
    And I am on the login page
    And I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"  
    And I press "Log In"

  Scenario: Successfully edit my account information
    Given I am on the team_index page
    Then I press "Edit My Info"
    And I fill in "Name" with "MasihxxSidxxMasih"
    And I press "Update Information"
    Then I should see "MasihxxSidxxMasih"
    