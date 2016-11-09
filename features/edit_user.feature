Feature: edit user information

  As a student
  So that I can fix any mistakes I made in inputting information
  I want to be able to edit my user information
  
  Background:
    Given the following users exist
     |   name    |       email       |password |team_passcode | major        |       sid      |
  	 | Jorge    |    legueoflegends667@hotmail.com  | password1 | 0 | Football Player | 999  |
 	   | Sahai     | eecs666@hotmail.com        | mypassword     | penguindrool | EECS            | 000  |
 	
 	And PENDING: I am on the login page
 	
  Scenario: An existing user logs in, joins a team, and edits his information
    Given I fill in "Email" with "legueoflegends667@hotmail.com"
    And I fill in "Password" with "password1"
    And I press "Log In"
    
    And I fill in "team_hash" with "penguindrool"
    And I press "Join"

    Given I follow "Edit My Info"
    And I fill in "Password" with "password2"
    And I press "Update Information"
    And I follow "Edit My Info"
    Then I should see "password2"
    