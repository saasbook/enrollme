Feature: Create an admin account
  As an admin
  In order to spread my workload
  I want to add another person as an admin
  
  Background:
    Given the following admins exist
     | name  | email                  | superadmin | ta     | enroll |
  	 | Bob   | supreme_ruler@aol.com  | true       | false  | false  |
  	 | Yon   | tim_ruler@aol.com      | false      | true   | false  |
  	 | Mon   | minjoo_ruler@aol.com   | false      | false  | true  |
  	And I am on the login page

  Scenario: An admin successfully adds another admin
    When I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Register New Admin"
    
    Given I fill in "Name" with "Bob Clone"
    And I fill in "Email" with "ruler_clone@aol.com"
    And I choose "type_admin_ta"
    And I press "Create"
    Then I log out
    When I log in as an admin with email "ruler_clone@aol.com"
    Then I should see "Welcome Back, Bob Clone!"
  
  Scenario: An super admin did not choose a type for admin type
    When I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Register New Admin"
    
    Given I fill in "Name" with "Bob Clone"
    And I fill in "Email" with "ruler_clone@aol.com"
    And I press "Create"
    Then I should see "Choose an admin type"

  Scenario: An admin fails adding another admin
    And I log in as an admin with email "supreme_ruler@aol.com"
    Then I follow "Register New Admin"
    
    Given I fill in "Name" with "Min Clone"
    And I fill in "Email" with "minjoo_ruler@aol.com"
    And I choose "type_admin_ta"
    And I press "Create"
    Then I should see "Form is invalid"
    
  Scenario: An admin fails adding a user as an admin
    And I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Register New Admin"
    
    Given the following users exist
     | name    |       email          |team_passcode | major | sid  |
 	   | Sahai   | eecs666@hotmail.com  | penguindrool | EECS  | 000  |
    Given I fill in "Name" with "Sahai"
    And I fill in "Email" with "eecs666@hotmail.com"
    And I choose "type_admin_ta"
    And I press "Create"
    Then I should see "Form is invalid"
    
    
  Scenario: A TA admin cannot manage admins etc.
    And I log in as an admin with email "tim_ruler@aol.com "
    Then I should not see "Register New Admin"
    And I should not see "Manage Admins"
    And I should not see "Reset Semester"
