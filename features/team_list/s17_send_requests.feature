Feature: Manage requests for joining teams
  As a user not currently in a team
  In order to join a team
  I want to be able to send requests to teams, and know their decisions

  Background: There is a team to join
    Given the following teams exist:
      |approved | passcode | submission_id | submitted | declared | pending_requests  |
      |“no”     | “bears1" | 0             | "no"      | "yes"    | 0                 |
      |“no”     | “bears2" | 1             | "no"      | "yes"    | 0                 |
      |“no”     | “bears2" | 2             | "no"      | "yes"    | 0                 |

    And the following users exist
      |Name | team_id |
      |Derek| nil|
      |Tony| nil|
      |An| 0|
      |Hezheng| 1|
      |George | 1|
      |Karl   | 1|
      |Ken    | 1|
      |Hadi   | 1|
      |Brandon| 1|
      |Sahai  | 2|
      |Hilfinger| 2|
      |Papadimitriou| 2|
      |Fox          | 2|
      |Patterson    | 2|

    And I am on the teams list page
    Given I login as "Derek"

    Scenario: I send a join request to a team that is not full
      Given I press the "Join" button on the same row as "An"
      Then I should see "request sent"
      Given I press "Requests"
      Then I should see "An"

    Scenario: I send a join request to a team that is full
      Given I press the "Join" button on the same row as "Hezheng"
      Then I should see "Team is Full"

    Scenario: I want to cancel an active join request
      Given I press the "Join" button on the same row as "An"
      Given I press "Requests"
      Given I press the "Cancel" button on the same row as "An"
      Then I should not see "An"

    Scenario: My request was accepted
      Given I press the "Join" button on the same row as "An"
      Given I login as "An"
      Given I press "Requests"
      Given I press the "Accept" button on the same row as "Derek"
      Then I should see "Request Approved"
      Then I should not see "Derek"
      Given I login as "Derek"
      Then I should see "An"

    Scenario: My request was denied
      Given I press the "Join" button on the same row as "An"
      Given I login as "An"
      Given I press "Requests"
      Given I press the "Reject" button on the same row as "Derek"
      Then I should see "Request Approved"
      Then I should not see "Derek"
      Given I login as "Derek"
      Then I should not see "An"

    Scenario: My request was to a team that is full
      Given I create the user:
        |Name   | team_id |
        |Denero | 2       |
      Given I press the "Join" button on the same row as "An"
      Then I should see "Team is now full"