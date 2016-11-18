Feature: Login with gmail oauth
  As a student
  In order to create an account and login
  I want to use gmail OAUTH

  Scenario: Successfully see login using OAUTH
    Given I am on the login page
    And I follow "log_in"
    Then I should see "Choose an account"
