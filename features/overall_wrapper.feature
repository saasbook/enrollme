Feature: A user can edit their profile

  As a student
  So that I can update any personal information changes
  I want to be able to change my personal information
  
  Background:
    Given the following users exist
     |   name    |       email       |password |team | major        |       sid      |
  	 | Jorge    |    legueoflegends667@hotmail.com  | password1 | 0 | Football Player | 999  |
 	   | Sahai     | eecs666@hotmail.com        | mypassword     | 1 | EECS            | 000  |
    And I am on the login page
    And I fill in "Email" with "legueoflegends667@hotmail.com"
    And I fill in "Password" with "password1"  
    And I press "Log In"

  Scenario: An edit button is on the home page
    Given I am on the home page
    Then I should see "Edit"

  Scenario:
    Given I am on the Team "1" page
    Then I should see "Edit"
    