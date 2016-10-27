Feature: edit user information

  As a student
  So that I can fix any mistakes I made in inputting information
  I want to be able to edit my user information
  
  Background:
    Given PENDING: the following users exist
     |   name    |       email       |password |team_passcode | major        |       sid      |
  	 | Jorge    |    legueoflegends667@hotmail.com  | password1 | 0 | Football Player | 999  |
 	   | Sahai     | eecs666@hotmail.com        | mypassword     | penguindrool | EECS            | 000  |
 	
 	And PENDING: I am on the login page
 	
  Scenario: An existing user logs in, joins a team, and edits his information
    Given PENDING: I fill in "Email" with "legueoflegends667@hotmail.com"
    And PENDING: I fill in "Password" with "password1"

    And PENDING: I press "Log In"
    And PENDING: I press "Create"
    
    And PENDING: I fill in "team_hash" with "penguindrool"
    And PENDING: I press "Join"

    Given PENDING: I follow "Edit My Info"
    And PENDING: I fill in "Password" with "password2"
    And PENDING: I press "Update Information"
    Then PENDING: I should see "password2"
    