Feature: Manage requests for joining teams
  As a user not currently in a team
  In order to join a team
  I want to be able to send requests to teams, and know their decisions

  Background: There is a team to join
    Given these users exist
      |   name    |       email                       | team      | major             | sid               | waitlisted  |
      | Tony      |     tony@berkeley.edu             | passcode7 | Slavic Studies    | 823               | true        |
      | An        |    bobjones0@berkeley.edu         | passcode0 | Slavic Studies    | 824               | true        |
      | Hezheng   |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               | true        |
      | George    |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               | true        |
      | Karl      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               | true        |
      | Ken       |    bobjones4@berkeley.edu         | passcode1 | Slavic Studies    | 828               | true        |
      | Hadi      |    xxx@berkeley.edu               | passcode1 | Slav1c Studies    | 830               | true        |
      | Brandon   |    xx2@berkeley.edu               | passcode1 | Slav1c Studies    | 831               | true        |
      | Sahai     |     sahai@berkeley.edu            | passcode2 | Slavic Studies    | 832               | true        |
      | Hilfinger |     hilf@berkeley.edu             | passcode2 | Slavic Studies    | 833               | true        |
      | PapaD     |     papa@berkeley.edu             | passcode2 | Slavic Studies    | 834               | true        |
      | Fox       |     fox@berkeley.edu              | passcode2 | Slavic Studies    | 835               | true        |
      | Patterson |     pat@berkeley.edu              | passcode2 | Slavic Studies    | 836               | true        |
      | Derek     |   derek@berkeley.edu              | passcode9 | Slavic Studies    | 12345678          | true        |

    And I am on the home page
    And I log in as a user with email "derek@berkeley.edu"
    And I follow "Team List"
  
  @javascript
  Scenario: I send a join request to a team that is not full
    Given I press the "Join Team" button on the same row as "An"
    Then I should see "Request message"
    When I press "Send"
    Then I should see "Your request has been sent successfully."
    And "bobjones0@berkeley.edu" should receive 1 email
    When I follow "Requests"
    Then I should see "An"
  
  @javascript
  Scenario: I want to cancel an active join request
    Given I press the "Join Team" button on the same row as "An"
    Then I should see "Request message"
    When I press "Send"
    And I follow "Requests"
    And I press the "Cancel" button on the same row as "An"
    Then I should not see "An"
    
  @javascript
  Scenario: I send a join request to a team that is full
    Given I press the "Join Team" button on the same row as "Hezheng"
    Then I should see "join is full"

  @javascript
  Scenario: My request was accepted
    Given I press the "Join Team" button on the same row as "An"
    Then I should see "Request message"
    When I press "Send"
    And I follow "Logout"
    And I log in as a user with email "bobjones0@berkeley.edu"
    And I follow "Requests"
    And I press the "Accept" button on the same row as "Derek"
    Then I should see "Request Approved"
    And I should not see "Derek"
    And I follow "Logout"
    Given I log in as a user with email "derek@berkeley.edu"
    Then I should see "An"
    
  @javascript
  Scenario: My request was denied
    Given I press the "Join Team" button on the same row as "An"
    Then I should see "Request message"
    When I press "Send"
    And I follow "Logout"
    And I log in as a user with email "bobjones0@berkeley.edu"
    And I follow "Requests"
    And I press the "Deny Request" button on the same row as "Derek"
    Then I should see "Request Denied"
    And I should not see "Derek"
    And I follow "Logout"
    Given I log in as a user with email "derek@berkeley.edu"
    Then I should not see "An"