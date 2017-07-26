Feature: Manage requests for joining teams
  As a member of a team
  In order to build my team
  I want to be able to accept or reject requests to join my team

  Background: There is a team to join
    Given the following teams exist:
      |approved | passcode | submission_id | submitted | declared | pending_requests  |
      |“no”     | “bears1"  | False     | 1             | 5           | 0             |
      |“no”     | “bears2"  | False     | 2             | 6           | 0             |

    And the following users exist
      |   name    |       email                       | team      | major             |       sid         |  waitlisted |
      | An        |    bobjones0@berkeley.edu         | passcode0 | Slavic Studies    | 824               | true |
      | Hezheng   |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               | true |
      | George    |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               | true |
      | Karl      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               | true |
      | Ken       |    bobjones4@berkeley.edu         | passcode1 | Slavic Studies    | 828               | true |
      | Hadi      |    xxx@berkeley.edu               | passcode1 | Slav1c Studies    | 830               | true |
      | Brandon   |    xx2@berkeley.edu               | passcode1 | Slav1c Studies    | 831               | true |
  
    
    And I am on the new_user page
    And I fill in "Name" with "Derek Chen"
    And I fill in "Email" with "derekchen@berkeley.edu"
    And I fill in "Sid" with "12345678"
    And I select "DECLARED CS/EECS Major" from "major"
    And I choose "user_waitlisted_true"
    And I press "Sign Up"
    And I follow "Team List"
  
  Scenario: I want to see the requests to join my group that still need to be processed
    Given "An" requests to join my team
    And "Derek" requests to join my team
    And the request from "An" was "denied"
    When I go to "Requests"
    Then I should see "Derek"
    And I should not see "An"
    
  Scenario: I want to accept a request
    Given "Derek" requests to join my team
    And I go to "Requests"
    When I press "Accept Request"
    Then I should not see "Derek"
    When I go to "My Team"
    Then I should see "Derek"
  
  Scenario: I want to accept a request, but the request was already accepted
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was "accepted"
    When I press "Accept Request"
    Then I should see "This request was already processed"
    And I should not see "Derek"
    When I go to "My Team"
    Then I should see "Derek"
  
  Scenario: I want to accept a request, but the request was already denied/withdrawn
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was "denied"
    When I press "Accept Request"
    Then I should see "This request was already processed"
    And I should not see "Derek"
    When I go to "My Team"
    Then I should not see "Derek"
  
  Scenario: I want to deny a request
    Given "Derek" requests to join my team
    And I go to "Requests"
    When I press "Deny Request"
    Then I should not see "Derek"
    When I go to "My Team"
    Then I should not see "Derek"
    
  Scenario: I want to deny a request, but the request was already accepted
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was "accepted"
    When I press "Deny Request"
    Then I should see "This request was already processed"
    And I should not see "Derek"
    When I go to "My Team"
    Then I should see "Derek"
    
  Scenario: I want to deny a request, but the request was already denied/withdrawn
    Given "Derek" requests to join my team
    And I am on "Requests"
    And the request from "Derek" was "accepted"
    When I press "Deny Request"
    Then I should see "This request was already processed"
    And I should not see "Derek"
    When I go to "My Team"
    Then I should not see "Derek"