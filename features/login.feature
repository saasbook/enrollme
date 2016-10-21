Feature: Login to my account
  As an student
  In order to create an account and login
  I want to create an account and login

  Scenario: Successfully create an account and login
    Given I am on the signup page
    When I fill in "Name" with "David"
    And I fill in "Email" with "david@berkeley.edu"
    And I fill in "Sid" with "12345678"
    And I fill in "Major" with "Declared"
    And I press "Create User"
    Then I should see "Create or Join a Team"
