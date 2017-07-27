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
      | An        |    an@berkeley.edu         | passcode0 | Slavic Studies    | 824               | true |
      | Hezheng   |    hezheng@berkeley.edu         | passcode1 | Slavic Studies    | 825               | true |
      | George    |    george@berkeley.edu         | passcode1 | Slavic Studies    | 826               | true |
      | Karl      |    karl@berkeley.edu         | passcode1 | Slavic Studies    | 827               | true |
      | Ken       |    ken@berkeley.edu         | passcode1 | Slavic Studies    | 828               | true |
      | Hadi      |    hadi@berkeley.edu               | passcode1 | Slav1c Studies    | 830               | true |
      | Brandon   |    brandon@berkeley.edu               | passcode1 | Slav1c Studies    | 831               | true |
      | Derek     |   derekchen@berkeley.edu          | nil       | Slavic Studies    | 12345678          | true |
  
    Given I am on the home page
    And I log in as a user with email "an@berkeley.edu"
    And I follow "Team List"
    And I press the "Join" button on the same row as "Hezheng, George, Karl, Ken, Hadi, Brandon"
    And I follow "Logout"
    And I am on the home page
    And I log in as a user with email "derekchen@berkeley.edu"
    And I follow "Team List"
    And I press the "Join" button on the same row as "Hezheng, George, Karl, Ken, Hadi, Brandon"
    And I follow "Logout"
    And I am on the home page
    And I log in as a user with email "hadi@berkeley.edu"
    And I follow "Requests"
  
    
  
  Scenario: I want to see the requests to join my group that still need to be processed
    Then I should see "An"
    And I should see "Derek"
    
  Scenario: I want to accept a request
    Then I should see "An"
    And I press the "Accept" button on the same row as "An"
    Then I should see "Request accepted"
  
  # Scenario: I want to accept a request, but the request was already accepted
  #   And the request from "Derek" was "accepted"
  #   When I press "Accept Request"
  #   Then I should see "This request was already processed"
  #   And I should not see "Derek"
  #   When I go to "My Team"
  #   Then I should see "Derek"
  
  # Scenario: I want to accept a request, but the request was already denied/withdrawn
  #   And the request from "Derek" was "denied"
  #   When I press "Accept Request"
  #   Then I should see "This request was already processed"
  #   And I should not see "Derek"
  #   When I go to "My Team"
  #   Then I should not see "Derek"
  
  # Scenario: I want to deny a request
  #   When I press "Deny Request"
  #   Then I should not see "Derek"
  #   When I go to "My Team"
  #   Then I should not see "Derek"
    
  # Scenario: I want to deny a request, but the request was already accepted
  #   And the request from "Derek" was "accepted"
  #   When I press "Deny Request"
  #   Then I should see "This request was already processed"
  #   And I should not see "Derek"
  #   When I go to "My Team"
  #   Then I should see "Derek"
    
  # Scenario: I want to deny a request, but the request was already denied/withdrawn
  #   And the request from "Derek" was "accepted"
  #   When I press "Deny Request"
  #   Then I should see "This request was already processed"
  #   And I should not see "Derek"
  #   When I go to "My Team"
  #   Then I should not see "Derek"