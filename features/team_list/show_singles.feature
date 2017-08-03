Feature: Show students who do not have a team
  As a students
  I want to find students who do not have a team
  So that I can invite a single student to team or form a team with a single student
  
  Background:
    Give the following users exist
      |   name    |       email                       | team      | major             |       sid         |  waitlisted |
      | Bob       |    bobjones0@berkeley.edu         | passcode1 | Slavic Studies    | 824               | true |
      | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               | true |
      | Sahai     |    xxx@berkeley.edu         | passcode2 | Slav1c Studies    | 830               | true |
      | Saha2     |    xx2@berkeley.edu         | passcode2 | Slav1c Studies    | 831               | true |
      | Jorge     |    legueoflegends667@hotmail.com  | passcode3 | Football Player   | 999               | true |
      | Bobby      | legueoflegends66@hotmail.com       | 0     | Football Player | 998                    | true        |

    
    And team "passcode1" has 0 pending requests
    And team "passcode2" has 2 pending requests
    And team "passcode3" has 1 pending request
    
    And team "passcode1" is declared
    And team "passcode2" is declared
    And team "passcode3" is not declared

    And I am on the home page
    And I log in as a user with email "bobjones0@berkeley.edu"
    And I follow "Team List"
    
    Scenario: A student looks for students who do not have a team
    When I press "Single Students"
    Then I should see "Bobby"
    And I should not see "Bob"