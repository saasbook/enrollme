Feature: Admin deletes his or her account
  As an admin
  In order to remove myself from the system
  I want to delete account
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    
  Scenario: Admin successfully deletes his or her account
    When PENDING: I press "Delete Account"
    Then PENDING: I should see "Are you sure?"
    When PENDING: I press "Yes"
    Then PENDING: I should see "CS 169 Enrollment"
    When PENDING: I log in as an admin with email "supreme_ruler@aol.com"
    Then PENDING: I should see "Account not created"
