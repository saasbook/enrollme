Feature: Allow users to view team profiles from team list by clicking on them
  As a user
  In order to see if a team is a good match for me
  I want to visit the team's profile by clicking on them in the team list
  
  Background:
    Given the following users exist
      |   name    |       email                       | team      | major             |       sid         |  waitlisted |
      | Bob       |    bobjones0@berkeley.edu         | passcode1 | Slavic Studies    | 824               | true |
      | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               | true |
      | Sahai     |    xxx@berkeley.edu         | passcode2 | Slav1c Studies    | 830               | true |
      | Saha2     |    xx2@berkeley.edu         | passcode2 | Slav1c Studies    | 831               | true |
      | Jorge     |    legueoflegends667@hotmail.com  | passcode3 | Football Player   | 999               | true |
    
    And team "passcode1" has 0 pending requests
    And team "passcode2" has 2 pending requests
    And team "passcode3" has 1 pending request
    
    And team "passcode1" is declared
    And team "passcode2" is declared
    And team "passcode3" is not declared
    
    And I am on the home page
    And I follow "Team List"

  # Link to team profile page when you click on the team's row
  Scenario: A user wants to visits a team's profile page
    Given I follow "Jorge"
    Then I should see "legueoflegends667@hotmail.com"
    And I should not see "Bob"
    And I should not see "Sahai"
