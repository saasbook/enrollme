Feature: Admin deletes his or her account
  As an admin
  In order to remove myself from the system
  I want to delete account
  
  Background:
    Given the following admins exist
      | name | email                  | superadmin |
  	  | Bob  | supreme_ruler@aol.com  | false      |
  	  | Tom  | tomcat@gmail.com       | true       |
    
  Scenario: Admin successfully deletes his or her account
    Given I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    When I follow "My Info"
    And I follow "Edit"
    And I press "Delete Me"
    Then I should see "Logged out!"
    
    When I log in as an admin with email "supreme_ruler@aol.com"
    Then I should see "Account not created"
    
  Scenario: Superadmin cannot delete his or her account
    Given I am on the login page
    And I log in as an admin with email "tomcat@gmail.com"
    When I follow "My Info"
    And I follow "Edit"
    And I press "Delete Me"
    Then I should see "Please give someone else superadmin powers before deleting yourself."
    And I should see "Welcome Back, Tom!"
