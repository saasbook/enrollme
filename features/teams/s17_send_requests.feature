Feature: Manage requests for joining teams
  As a user not currently in a team
  In order to join a team
  I want to be able to send requests to teams, and know their decisions

  Background: There is a team to join
    Given the following teams exist:
      |approved | passcode | submission_id | submitted | declared |
      |“no”     | “bears1" | 0             | "no"      | "yes"    |
      |“no”     | “bears2" | 1             | "no"      | "yes"    |
      |“no”     | “bears2" | 2             | "no"      | "yes"    |

    Given the following users exist
      |name              |email               |major |sid         |team_id  |waitlisted |
      |Edsgar Dijkstra   |dijkstra@gmail.com  |'CS'  |11111111    |1        |true       |
      |John Von Neuman   |neuman@gmail.com    |'CS'  |11111112    |2        |true       |
      |Kurt Godel        |godel@gmail.com     |'CS'  |11111113    |3        |true       |

    And I am on the home page
    Given I log in as a user with email "dijkstra@gmail.com"
    Then show me the page
    Given I follow "Team List"

    Scenario: I send a join request to a team that is not full
      Given I press the "Join" button on the same row as "An"
      Then I should see "Request Sent"
      Given I press "Requests"
      Then I should see "An"

