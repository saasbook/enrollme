Feature: I should choose my major from a dropdown menu when filling my information 

Background:
    Given the following users exist
     |   name    |       email       |password |team_passcode | major        |       sid      |
  	 | Jorge    |    legueoflegends667@hotmail.com  | password1 | 0 | Football Player | 999  |
 	   | Sahai     | eecs666@hotmail.com        | mypassword     | penguindrool | EECS            | 000  |
    And I am on the login page
  
  
 Scenario: An existing user logs in, joins a team, and edits his major
    Given I fill in "Email" with "legueoflegends667@hotmail.com"
    And I fill in "Password" with "password1"
    And I press "Log In"
    
    And I fill in "team_hash" with "penguindrool"
    And I press "Join"

    Given I follow "Edit My Info"
    And I select "DECLARED CS/EECS Major" from "major"
    And I press "Update Information"
    Then I should see "My Team"
    
  Scenario: Successfully create an account and login
    Given I am on the new_user page
    When I fill in "Name" with "David"
    And I fill in "Email" with "david@berkeley.edu"
    And I fill in "Sid" with "12345678"
    And I select "DECLARED CS/EECS Major" from "major"
    And I fill in "Password" with "bestpasswordeva"
    And I press "Sign Up"