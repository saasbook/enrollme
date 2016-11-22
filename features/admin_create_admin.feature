Feature: Create a new admin
  As an admin
  In order to delegate access
  I want to create an admin
  
  Background:
    Given the following admins exist
     | name | email                  |
  	 | Bob  | supreme_ruler@aol.com  |
    And I am on the login page

  Scenario: Successfully create an new admin, and new admin logs in
    Given I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Register New Admin"
    And I fill in "Email" with "enrollmeberkeley@gmail.com"
    And I fill in "Name" with "Enroll Me"
    And I press "Create"
    Then I should see "Welcome Back, Bob!"
    And I should see "You created admin Enroll Me successfully!"
    And I follow "Logout"
    And I log in as an admin with email "enrollmeberkeley@gmail.com"
    Then I should see "Welcome Back, Enroll Me!"
