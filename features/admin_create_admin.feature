Feature: Create a new admin
  As an admin
  In order to delegate access
  I want to create an admin
  
  Background:
    Given the following admins exist
     | name | email                  | password |
  	 | Bob  | supreme_ruler@aol.com  | ilikcats |

    And I am on the login page

  Scenario: Successfully create an new admin, and new admin logs in
    Given I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And I press "Create New Admin"
    And I fill in "Email" with "enrollmeberkeley@gmail.com"
    And I fill in "Password" with "aaa"
    And I fill in "Name" with "Enroll Me"
    And I press "Create"
    Then I should see "Welcome Back, Bob!"
    And I should see "You created admin Enroll Me successfully!"
    And I follow "Logout"
    And I fill in "Email" with "enrollmeberkeley@gmail.com"
    And I fill in "Password" with "aaa"
    And I press "Log In"
    And I should see "Welcome Back, Enroll Me!"