Feature: Student indicates whether they are on the waitlist for the class
  As a student
  In order to enroll in the class expeditiously
  I want to indicate whether i'm on the waitlist and see other people's and team's waitlist statuses
  
  Background: I am creating an account and have filled in all fields but waitlist checkbox
    Given I am on the new_user page
    When I fill in "Name" with "David"
    And I fill in "Email" with "david@berkeley.edu"
    And I fill in "Sid" with "12345678"
    And I select "DECLARED CS/EECS Major" from "major"

 
  Scenario: User should not be able to sign up without indicating waitlist status
    Given I press "Sign Up"
    Then I should see "Form is invalid"
    
  Scenario: User should not be able to check both yes and no for waitlist status
    Given I should see "Waitlisted?"
    And I choose "user_waitlisted_false"
    And I choose "user_waitlisted_true"
    Then the "user_waitlisted_true" radio button should be checked
    And the "user_waitlisted_false" radio button should not be checked

  Scenario: User should see waitlist status in my information
    Given I choose "user_waitlisted_true"
    And I press "Sign Up"
    And I follow "My Info"
    Then I should see "Waitlisted? Yes"

