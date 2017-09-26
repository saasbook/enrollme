#Feature: clickable banner to show potential matches with teams
#    As a user
#    In order to find teams or users
#    I want a constant feed of users/groups that I can send join requests to
#
#    Given the following users exist
#      |   name    |       email                       | major             | sid |  waitlisted | team_id |
#      | Bob       |    bobjones0@berkeley.edu         | Slavic Studies    | 824 | true        | 1       |
#      | Bob1      |    bobjones1@berkeley.edu         | Slavic Studies    | 825 | true        | 1       |
#      | Bob2      |    bobjones2@berkeley.edu         | Slavic Studies    | 826 | true        | 1       |
#      | Bob3      |    bobjones3@berkeley.edu         | Slavic Studies    | 827 | true        | 1       |
#      | Bob4      |    bobjones4@berkeley.edu         | Slavic Studies    | 828 | true        | 1       |
#      | Hilfinger |    hilfinger@berkeley.edu         | EECS              | 824 | true        | 1       |
#      | Sahai     |    sahai@berkeley.edu             | EECS              | 825 | true        | 1       |
#      | Denero    |    Denero@berkeley.edu            | EECS              | 826 | true        | 1       |
#      | Hug       |    Hug@berkeley.edu               | EECS              | 827 | true        | 1       |
#      | Alon      |    Alon@berkeley.edu              | EECS              | 828 | true        | 1       |
#      | Alice     |    alice@berkeley.edu             | CS                | 900 | true        | nil     |
#
#
#    And I visit the teams list page
#
#Scenario: I am viewing teams
#    And I press "teams"
#    Then I should see Bob1
#    And I should not see Alice
#
#Scenario: I am viewing singles
#    When I press "individuals"
#    Then I should see Alice
#    And I should not see Bob
#
#Scenario: I send a request to a suggestion from the banner
#    When I press "teams"
#    And I press "accept"
#    Then I should not see "Bob"
#    When I press "requests"
#    Then I should see "Bob"
#
#Scenario: I decline to request a suggestion from the banner
#    When I press "teams"
#    And I press "next"
#    Then I should not see "Bob"
#    And I should see "Sahai"
#
#Scenario: I run out of suggestions:
#   When I press "teams"
#   And I press "next"
#   And I press "next"
#   Then I should see "Sahai"
#   And I should not see "Bob"
#
#