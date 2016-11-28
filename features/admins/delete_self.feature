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
    When I follow "Edit My Info"
    And I press "Delete Me"
    Then I should see "Logged out!"
    
    When I log in as an admin with email "supreme_ruler@aol.com"
    Then I should see "Account not created"
