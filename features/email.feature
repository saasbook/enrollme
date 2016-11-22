Feature: Email me
  As an admin
  In order to check on CS 169 enrollment
  I want to be emailed
  
  Background:
    Given the following admins exist
     | name | email                  |
  	 | Bob  | enrollmeberkeley@gmail.com  |

    And I am on the login page

  Scenario: Successfully create an account with my name and email
    When I log in as an admin with email "enrollmeberkeley@gmail.com"
    And I follow "Email Me"
    And I should see "Welcome Back, Bob!"
