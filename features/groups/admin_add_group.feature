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

    And the following discussions exist
    #number, time, day, capacity, seats_open
      | number  | time    |  day     | capacity   | seats_open |
      | 79997   | 3:00 PM |  Tuesday |  24        | 24         |
      | 89998   | 4:00 PM |  Tuesday |  24        | 24         |
    And the following teams exist
      |  submission_id   | approved  | passcode  | submitted | discussion_number  |
      |  1               | true      | "asdf"    | true      | 79997              |
      |  2               | true      | "fdsa"    | true      | 79997              |
      |  3               | true      | "dididi"  | true      | 89998              |
      |  4               | true      | "tiredmj" | true      | 89998              |


  Scenario: An admin merges two valid teams in the same discussion
    Given I press "Create Groups"
    When I check "team_1"
    And I check "team_2"
    And I press "Create Group"
    And I should see team "3"
    And I should see team "4"
    Then I should not see team "1"
    And I should not see team "2"


  Scenario: An admin merges two valid teams in different discussions
    Given I press "Create Groups"
    When I check "team_1"
    And I check "team_3"
    And I press "Create Group"
    Then I should see team "1"
    And I should see team "3"

  Scenario: An admin unmerges a group
    Given I press "Create Groups"
    When I check "team_1"
    And I check "team_2"
    And I press "Create Group"
    And I follow "Back"
    And I press "View Groups"
    # And byebug
    And I check "group_1"
    And I press "Destroy Group"
    Then I should not see group "1"