Feature: Login to my account
  As a student
  In order to create an account and login
  I want to create an account and login

  Scenario: Successfully create an account and login
    Given I am on the new_user page
    When I fill in "Name" with "David"
    And I fill in "Email" with "david@berkeley.edu"
    And I fill in "Sid" with "12345678"
    And I select "DECLARED CS/EECS Major" from "major"
    And I press "Sign Up"
    Then I should see "Create or Join a Team"
    
  Scenario: Create an invalid user account
    Given I am on the new_user page
    And I press "Sign Up"
    Then I should see "Form is invalid"
    
  Scenario: Create an invalid admin account
    Given I am on the new_admin page
    And I press "Create"
    Then I should not see "You created admin"
