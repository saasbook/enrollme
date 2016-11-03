Feature: Create and use an admin account
  As an admin
  In order to look at teams
  I want to create an account
  
  Background:
    Given the following admins exist
     | name | email                  | password |
  	 | Bob  | supreme_ruler@aol.com  | ilikcats |

  Scenario: Successfully create an account and login
    Given I am on the new_admin page
    When I fill in "Name" with "David"
    And I fill in "Email" with "david@berkeley.edu"
    And I fill in "Password" with "bestpasswordeva"
    And I press "Sign Up"
    Then I should see "Welcome Back, David!"
    
  Scenario: An admin cancels editing their information
    Given I am on the login page
    Then I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And I follow "Edit My Info"
    And I follow "Cancel"
    Then I should see "Welcome Back, Bob!"

  Scenario: Successfully edit my account information
    Given I am on the login page
    Then I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    Then I follow "Edit My Info"
    And I fill in "Name" with "BetterBob"
    And I press "Update Information"
    Then I should see "Welcome Back, BetterBob!"
    
