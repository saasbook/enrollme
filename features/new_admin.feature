Feature: Create and use an admin account
  As an admin
  In order to look at teams
  I want to create an account
  
  Background:
    Given the following admins exist
     | name  | email                  |
  	 | Bob   | supreme_ruler@aol.com  |
  	 | David | david@berkeley.edu     |
    
  Scenario: An admin cancels editing their information
    Given I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Edit My Info"
    And I follow "Cancel"
    Then I should see "Welcome Back, Bob!"

  Scenario: Successfully edit my account information
    Given I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    Then I follow "Edit My Info"
    And I fill in "Name" with "BetterBob"
    And I press "Update Information"
    Then I should see "Welcome Back, BetterBob!"
    
