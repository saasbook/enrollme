Feature: admin can create a Group by selecting two teams

  As an administrator
  So I can make a group
  I want to select two teams and create a group

  Background:
    Given the following admins exist
      | name  | email                  |
      | Bob   | supreme_ruler@aol.com  |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    And the following teams exist
      |  submission_id   | approved  | passcode  | submitted | discussion_id |
      |  1               | true      | "asdf"    | true      | 79997        |
      |  2               | true      | "fdsa"    | true      | 79997        |
      |  3               | true      | "dididi"  | true      | 89998        |
      |  4               | true      | "tiredmj" | true      | 89998        |
    And the following discussions exist
    #number, time, day, capacity, seats_open
      | number  | time    |  day     | capacity   | seats_open |
      | 79997   | 3:00 PM |  Tuesday |  24        | 24         |
      | 89998   | 4:00 PM |  Tuesday |  24        | 24         |

  Scenario: An admin merges two valid teams in the same discussion
    Given I press "Create Groups"
    When I check "team_1"
    And I check "team_2"
    And byebug
    And I press "Create Group"
    Then I should not see "team_1"
    And I should not see "team_2"
    And I should see "3"
    And I should see "4"

  Scenario: An admin merges two valid teams in different discussions
    Given I press "Create Groups"
    When I check "team_1"
    And I check "team_3"
    And I press "Create Group"
    Then I should see "1"
    And I should see "3"