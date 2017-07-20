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

  Scenario: I want to approve a request and my team has room
