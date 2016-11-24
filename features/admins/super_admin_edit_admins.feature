Feature: Super admin deletes an admin
  
  As a super admin
  So that I can control other admins
  I want to be able to delete them
  
  Background:
    Given the following admin exists
      | name  | email                  | password | superadmin |
  	  | Bob   | supreme_ruler@aol.com  | ilikcats | true       |
  	  | Carol | abc@abc.com            | abc      | false      |
   	And I am on the login page

  Scenario: Super admin successfully deletes another admin
    When I log in as an admin with email "supreme_ruler@aol.com"
    And PENDING: I press "Edit Admins"
    And PENDING: I follow "delete_Carol"
    Then PENDING: I should not see "Carol"
    
  Scenario: Regular admin cannot access the super admin page
    When I log in as an admin with email "abc@abc.com"
    Then PENDING: I should not see "Edit Admins"
    
  Scenario: Super Admin successfully transfers super admin ability to another
    When I log in as an admin with email "supreme_ruler@aol.com"
    And PENDING: I press "Edit Admins"
    And PENDING: I choose "transfer_Carol"
    And PENDING: I press "Transfer"
    Then PENDING: I should see "Admin powers transferred!"
    And PENDING: I should be on the admin home page
    And PENDING: I should not see "Edit Admins"
    