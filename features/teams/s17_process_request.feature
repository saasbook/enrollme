Feature: Manage requests for joining teams
  As a member of a team
  In order to build my team
  I want to be able to accept or reject requests to join my team

  Background: There is a team to join
    Given the following teams exist:
      |approved | passcode | submission_id | submitted | declared | pending_requests  |
      |“no”     | “bears1"  | False     | 1             | 5           | 0             |
      |“no”     | “bears2"  | False     | 2             | 6           | 0             |

    And the following users exist:
      |Name | team_id |
      |Derek| nil|
      |An| 0|
      |Hezheng| 1|
      |George | 1|
      |Karl   | 1|
      |Ken    | 1|
      |Hadi   | 1|
      |Brandon| 1|
    
    And I login as "Hadi"
    And I am on "Requests"
  
  Scenario: I want to see the requests to join my group that still need to be processed
    Given "An" requests to join my team
    And "Derek" requests to join my team
    And the request from "An" was denied
    When I go to "Requests"
    Then I should see "Derek" in "Incoming Requests"
    And I should not see "An" in "Incoming Requests"
    
  Scenario: I want to accept a request
    Given "Derek" requests to join my team
    And I go to "Requests"
    When I press "Accept Request"
    Then I should not see "Derek" in "Incoming Requests"
    When I go to "My Team"
    Then I should see "Derek"
  
  Scenario: I want to accept a request, but the request was already accepted
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was accepted
    When I press "Accept Request"
    Then I should see "This request was already processed"
    And I should not see "Derek" in "Incoming Requests"
    When I go to "My Team"
    Then I should see "Derek"
  
  Scenario: I want to accept a request, but the request was already denied/withdrawn
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was denied
    When I press "Accept Request"
    Then I should see "This request was already processed"
    And I should not see "Derek" in "Incoming Requests"
    When I go to "My Team"
    Then I should not see "Derek"
  
  Scenario: I want to deny a request
    Given "Derek" requests to join my team
    And I go to "Requests"
    When I press "Deny Request"
    Then I should not see "Derek" in "Incoming Requests"
    When I go to "My Team"
    Then I should not see "Derek"
    
  Scenario: I want to deny a request, but the request was already accepted
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was accepted
    When I press "Deny Request"
    Then I should see "This request was already processed"
    And I should not see "Derek" in "Incoming Requests"
    When I go to "My Team"
    Then I should see "Derek"
    
  Scenario: I want to deny a request, but the request was already denied/withdrawn
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was accepted
    When I press "Deny Request"
    Then I should see "This request was already processed"
    And I should not see "Derek" in "Incoming Requests"
    When I go to "My Team"
    Then I should not see "Derek"