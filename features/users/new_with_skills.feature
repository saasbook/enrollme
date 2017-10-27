Feature: Student creates a new account (with skills)
  As a student
  I want to be able to add specific skills to my profile for account sign up

  Background:
    Given I am on the home page
    And I follow "sign_up"

  Scenario: User successfully creates an account and logs in
    When I fill in "Name" with "David"
    And I fill in "Sid" with "12345678"
    And I fill in "Skills" with "Frontend"
    And I select "DECLARED CS/EECS Major" from "major"
    And I press "Sign Up"
    Then I should see "Create or Join a Team"

  Scenario: User fails to create an account
    And I press "Sign Up"
    Then I should see "Form is invalid"
