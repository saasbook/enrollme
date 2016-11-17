Feature: edit user information

  As a student
  So that I can fix any mistakes I made in inputting information
  I want to be able to edit my user information
  
  Background:
    Given the following users exist
     |   name    |       email       |password |team_passcode | major        |       sid      |
  	 | Jorge    |    legueoflegends667@hotmail.com  | password1 | 0 | Football Player | 999  |
 	   | Sahai     | eecs666@hotmail.com        | mypassword     | penguindrool | EECS            | 000  |
 	
 	And I am on the login page
 	
  Scenario: An existing user logs in, joins a team, and edits his information
    Given I log in as a user with email "legueoflegends667@hotmail.com"

    And I fill in "team_hash" with "penguindrool"
    And I press "Join"
    Then I should not see "NewName"

    When I follow "Edit My Info"
    And I fill in "Name" with "NewName"
    And I press "Update Information"
    Then I should see "NewName"
    