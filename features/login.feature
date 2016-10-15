Feature: Login to my account
  As an student
  In order to create an account and login
  I want to create an account and login

  Scenario: Successfully create an account and login
    Given I am on the login page
    When I fill in "Name" with "David"
    And I fill in "Email" with "david@berkeley.edu"
    And I fill in "SID" with "12345678"
    And I fill in "Major" with "Declared"
    And I press "Create Account"
    Then I should be on the create or join team page
