Feature: Create an admin account
  As an admin
  In order to spread my workload
  I want to add another person as an admin
  
  Background:
    Given the following admins exist
     | name  | email                  |
  	 | Bob   | supreme_ruler@aol.com  |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "My Info"
    And I follow "Edit"

  Scenario: An admin cancels editing their information
    When I follow "Cancel"
    Then I should see "Welcome Back, Bob!"

  Scenario: Successfully edit my account information
    When I fill in "Name" with "BetterBob"
    And I press "Update Information"
    Then I should see "Welcome Back, BetterBob!"
    