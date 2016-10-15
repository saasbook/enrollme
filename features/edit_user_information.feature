Feature: Existing user can edit information
  As an existing user
  In order to correct any errors
  I should be able to edit my information
  
  Background:
    Given PENDING: the following users exist
     |   name    |       email        | SID        |       major      |
     | Bob Jones | bobjones@gmail.com | 12345678   | Computer Science |
    And PENDING: I am on the home page
    
  Scenario: An existing user can edit his or her information
    Given PENDING: "Bob Jones" logs in
    When PENDING: I follow "Edit Profile"
    Then PENDING: I should see "Bob"
    And PENDING: I should see "Jones"
    And PENDING: I should see "12345678"
    When PENDING: I fill in "SID" with "12345679"
    And PENDING: I press "Save"
    Then PENDING: I should see "12345679"
