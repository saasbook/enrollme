Feature: Email me
  As an admin
  In order to check on CS 169 enrollment
  I want to be emailed
  
  Background:
    Given the following admins exist
     | name | email                  | password |
  	 | Bob  | enrollmeberkeley@gmail.com  | ilikcats |

    And I am on the login page

  Scenario: Successfully create an account with my name and email
    When I fill in "Email" with "enrollmeberkeley@gmail.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And I follow "Email Me"
    And I should see "Welcome Back, Bob!"
