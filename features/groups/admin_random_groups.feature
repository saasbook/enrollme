Feature: admin can Randomly form groups based on their discussion 

  As an administrator
  So that when I want to group teams
  I want to group teams randomly 
  
  Background:
    Given the following admins exist
      | name  | email                  |
      | Bob   | supreme_ruler@aol.com  |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 79997   | Tues, 3pm    |  25       |
   	 | 79996   | Tues, 4pm    |  25       |
   	 | 79995   | Tues, 5pm    |  25       |
   	 | 79994   | Tues, 6pm    |  25       |
  
    And the following teams exist
      |  submission_id   | approved  | passcode  | submitted | discussion_id |
      |  1               | true      | "asdf"    | true      | 79997         |
      |  2               | true      | "fdsa"    | true      | 79996         |
      |  3               | true      | "dididi"  | true      | 79994         |
      |  4               | true      | "tiredmj" | true      | 79994         |
      |  5               | true      | "dididi1" | true      | 79994         |
      |  6               | true      | "tiredm2" | true      | 79994         |
    
# Scenario: An admin can group teams in the same discussion
#     Given I press "Create Groups"
#     When I press "Group randomly"
#     Then I should see team "1"
#     And I should see team "2"
#     And I should not see team "3"
#     And I should not see team "4"
    
Scenario: Teams in different discussions cannot be grouped randomly
    Given I press "Create Groups"
    When I press "Group randomly"
    Then I should see "Randomly grouped 2 groups"
    Then I go home
    Then I press "Create Groups"
    Then I should see team "1"
    And I should see team "2"
    And I should not see team "3"
    And I should not see team "4"
    And I should not see team "5"
    And I should not see team "6"
    Then I press "Group randomly"
    Then I should see "Cannot randomly create groups"
