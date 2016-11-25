Feature: Super admin deletes an admin
  
  As a super admin
  So that I can control other admins
  I want to be able to delete them
  
  Background:
    Given the following admins exist
      | name  | email                  | password | superadmin |
  	  | Bob   | supreme_ruler@aol.com  | ilikcats | true       |
  	  | Carol | abc@abc.com            | abc      | false      |
   	And I am on the login page

  Scenario: Super admin successfully deletes another admin
    When I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Manage Admins"
    And I follow "Delete Carol"
    And I follow "Manage Admins"
    Then I should not see "Carol"
    
  Scenario: Regular admin cannot access the super admin page
    When I log in as an admin with email "abc@abc.com"
    Then I should not see "Manage Admins"
    
  Scenario: Super Admin successfully transfers super admin ability to another
    When I log in as an admin with email "supreme_ruler@aol.com"
    And I follow "Manage Admins"
    And I choose "transfer_admin_2"
    And I press "Transfer"
    Then I should see "Successfully transferred superadmin powers."
    And I should not see "Manage Admins"
    