Feature: Login to my account
  As an admin
  In order to check on CS 169 enrollment
  I want to create an account
  
  Background:
    Given the following admins exist
     | name | email                  |
  	 | Bob  | supreme_ruler@aol.com  |

    And I am on the login page

  Scenario: Successfully create an account with my name and email
    When I log in as an admin with email "supreme_ruler@aol.com"
    Then I should see "Welcome Back, Bob!"
