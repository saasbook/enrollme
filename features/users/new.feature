Feature: Student creates a new account
  As a student
  In order to enroll for CS169 and submit a team
  I want to create an account on EnrollMe

  Background:
    Given the following admins exist
      | name | email                  | password |
      | Bob  | eecs666@hotmail.com    | ilikcats |
    And I am on the login page
    And I log in as an admin with email "eecs666@hotmail.com"
    And I am on the skills page
    And I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    And I log out
    And print page body
    And I press "sign_up"

  Scenario: User successfully creates an account and logs in
    When I fill in "Name" with "David"
    And I fill in "Sid" with "12345677"
    And I select "DECLARED CS/EECS Major" from "major"
    And I check "Frontend"
    And I press "Sign Up"
    Then I should see "Create or Join a Team"

  Scenario: User fails to create an account
    And I press "Sign Up"
    Then I should see "Form is invalid"

  Scenario: An admin cannot sign up as a user
    Given the following admins exist
     | name  | email                  |
  	 | Bob   | eecs666@hotmail.com  |
  	And I fill in "Name" with "Bob"
    And I fill in "Sid" with "98745632"
    And I select "Other Major" from "major"
    And I press "Sign Up"
    Then I should see "Form is invalid"
