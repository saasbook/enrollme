Feature: Student creates a new account
  As a student
  In order to enroll for CS169 and submit a team
  I want to create an account on EnrollMe
  
  Background:
    Given I am on the new_user page

  Scenario: User successfully creates an account and logs in
    When I fill in "Name" with "David"
    And I fill in "Email" with "david@berkeley.edu"
    And I fill in "Sid" with "12345678"
    And I select "DECLARED CS/EECS Major" from "major"
    And I press "Sign Up"
    Then I should see "Create or Join a Team"
    
  Scenario: User fails to create an account
    And I press "Sign Up"
    Then I should see "Form is invalid"
