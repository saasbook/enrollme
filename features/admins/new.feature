Feature: Create an admin account
  As an admin
  In order to spread my workload
  I want to add another person as an admin
  
  Background:
    Given the following admins exist
     | name  | email                  |
  	 | Bob   | supreme_ruler@aol.com  |
  	And I am on the login page
  	And I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Register New Admin"

  Scenario: An admin successfully adds another admin
    Given I fill in "Name" with "Bob Clone"
    And I fill in "Email" with "ruler_clone@aol.com"
    And I press "Create"
    Then I log out
    When I log in as an admin with email "ruler_clone@aol.com"
    Then I should see "Welcome Back, Bob Clone!"

  Scenario: An admin fails adding another admin
    Given I fill in "Name" with "Bob Clone"
    And I fill in "Email" with "supreme_ruler@aol.com"
    And I press "Create"
    Then I should see "Form is invalid"
    
  Scenario: An admin fails adding a user as an admin
    Given the following users exist
     | name    |       email          |team_passcode | major | sid  | waitlisted |
 	   | Sahai   | eecs666@hotmail.com  | penguindrool | EECS  | 000  | Yes |
    Given I fill in "Name" with "Sahai"
    And I fill in "Email" with "eecs666@hotmail.com"
    And I press "Create"
    Then I should see "Form is invalid"
