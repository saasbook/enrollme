Feature: Existing user can edit information
  As an existing user
  In order to correct any errors
  I should be able to edit my information
  
  Background:
    Given the following users exist
     |   name    |       email       |password |team | major        |       sid      |
  	 | Bob    |    bobjones@berkeley.edu  | pikachu | 0 | Slavic Studies | 12345  |
    Given PENDING: I am on the home page
    
  Scenario: An existing user can edit his or her information
    When PENDING: I fill in "email" with "bobjones@berkeley.edu"
    And PENDING: I fill in "password" with "pikachu"
    And PENDING: I press "Log In"
    When PENDING: I follow "Edit Profile"
    Then PENDING: I should see "Bob"
    When PENDING: I fill in "SID" with "12346"
    And PENDING: I press "Submit"
    And PENDING: I follow "Edit Profile"
    Then PENDING: I should see "112"
