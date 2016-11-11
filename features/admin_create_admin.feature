Feature: Create a new admin
  As an admin
  In order to delegate access
  I want to create an admin
  
  Background:
    Given the following admins exist
     | name | email                  | password |
  	 | Bob  | supreme_ruler@aol.com  | ilikcats |

    And I am on the login page

  Scenario: Successfully create an new admin
    Given I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And PENDING: I press "Create New Admin"
    And PENDING: I fill in "Email" with "enrollmeberkeley@gmail.com"
    And PENDING: I fill in "Password" with "aaa"
    And PENDING: I fill in "Name" with "Enroll Me"
    And PENDING: I press "Submit"
    Then PENDING: I should see "Welcome Back, Bob!"

  Scenario: New admin creates an account
    Given PENDING: I fill in "Email" with "enrollmeberkeley@gmail.com"
    And PENDING: I fill in "Password" with "aaa"
    Then PENDING: I should see "Welcome Back, Enroll Me!"