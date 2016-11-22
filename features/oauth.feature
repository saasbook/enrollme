Feature: Login with gmail oauth
  As a student
  In order to create an account and login
  I want to use gmail OAUTH

  Scenario: Should redirect to sign up page when user does not have an enrollme account yet
    Given I am on the login page
    And I log in as a user with email "flimflam@berkeley.edu"
    Then I should see "Account not created yet, please sign up!"

  Scenario: Should go to team page when user has an enrollme account
    Given I am on the login page
    And I log in as a user with email "flimflam@berkeley.edu"
    Then I should see "Account not created yet, please sign up!"
    And I fill in "Name" with "Flim Flam"
    And I fill in "Email" with "flimflam@berkeley.edu"
    And I fill in "Sid" with "24257318"
    And I select "Other Major" from "major"
    And I press "Sign Up"
    Then I should see "Create or Join a Team"
    And I press "Create a Team"
    And I follow "Logout"
    And I log in as a user with email "flimflam@berkeley.edu"
    Then I should see "Logged in!"