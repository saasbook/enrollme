Feature: Use an admin acccount to see organized team data
    
  
  Background:
    Given the following admins exist
     | name | email                  | password |
  	 | Bob  | supreme_ruler@aol.com  | ilikcats |


  Scenario: See organized data and aprove or not 
    Given I am on the login page
    Then I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    Then I should see "Team ID"
    Then PENDING: I should see "Name"
    Then I should see "SID"
    Then I should see "Major"
    Then I should see "Team Status"
    
  Scenario: change from disaprove to approve a team
    Given I am on the login page
    Then I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And PENDING: I check "Approved"
    When PENDING: I press "Change Status" 
    And I press "Disapprove"
    Then PENDING: I should not see that team
    
  Scenario: approve a team
    Given I am on the login page
    Then I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And PENDING: I check "Pending"
    When PENDING: I press "Change Status" 
    And I press "Approve"
    Then PENDING: I should not see that team