Feature: Login with gmail oauth
  As a student
  In order to create an account and login
  I want to use gmail OAUTH

  Scenario: Should redirect to sign up page when user does not have an enrollme account yet
    Given I am on the login page
    And I log in as a user with email "flimflam@berkeley.edu"
    Then I should see "Account not created yet, please sign up!"
