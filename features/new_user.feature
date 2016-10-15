Feature: New user can create profile
  As a new user
  In order to join or create a team
  I should be able to create a profile
    
  Background:
    Given PENDING: the following users exist
     |   name    |       email        | SID        |       major      |
     | Bob Jones | bobjones@gmail.com | 12345678   | Computer Science |
    And PENDING: I am on the home page
    
  Scenario: A new user creates a profile
    When PENDING: I follow "New User"
    And PENDING: I fill in "First Name" with "Bob"
    And PENDING: I fill in "Last Name" with "Jones"
    And PENDING: I fill in "Email" with "bobjones@berkeley.edu"
    And PENDING: I fill in "SID" with "12345678"
    And PENDING: I select "Computer Science" from "Major"
    And PENDING: I press "Save"
    Then PENDING: I should see "Enter team hash to join team"
    