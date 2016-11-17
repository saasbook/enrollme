Feature: Login to my account
  As an admin
  In order to check on CS 169 enrollment
  I want to create an account
  
  Background:
    Given the following admins exist
     | name | email                  | password |
  	 | Bob  | supreme_ruler@aol.com  | ilikcats |

    And I am on the login page

  Scenario: Successfully create an account with my name and email
    When I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And I should see "Welcome Back, Bob!"
