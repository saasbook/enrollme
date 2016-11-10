Feature: admin adds discussion times
  As an admin
  In order for students to sign up for discussion
  I want to add discussion times
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page

  Scenario: Admin successfully adds discussion times
    Given PENDING: I fill in "Email" with "supreme_ruler@aol.com"
    And PENDING: I fill in "Password" with "ilikcats"
    And PENDING: I press "Log In"
    
    Then PENDING: I should see "Not Approved"
    When PENDING: I go to the approve team "1" page
    Then PENDING: I should not see "Not Approved"
    And PENDING: I go to the disapprove team "1" page
    Then PENDING: I should see "Not Approved"
    
  Scenario: A non-admin fails to add discussion times
    Given PENDING: I fill in "Email" with "legueoflegends667@hotmail.com"
    And PENDING: I fill in "Password" with "password1"
    And PENDING: I press "Log In"
    When PENDING: I go to the approve team "1" page
    Then PENDING: I should see "Permission denied"
    And PENDING: I go to the disapprove team "1" page
    Then PENDING: I should see "Permission denied"
