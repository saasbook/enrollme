Feature: Table for finding and joining teams
  As a user
  In order to find an open team that suits my preferences
  I want to see all the currently open teams and be able to view, sort, and join/leave them
  
  Background:
    Given a listing of teams with the following information
    | group_members | number_of_members | number_of_pending_requests | all_declared | request |
    | George Su | 1 | 0 | No | Invite |
    | Derek Hsiao, Ken Chiu | 2 | 2 | Yes | Leave |
    | Hadi Zhang, George Poo | 2 | 1 | No | Join |
    | Karl Hayek, Brandon Jabr, Carina Boo | 3 | 10 | Yes | Join |
  
  # Index should have teams sorted in descending order based on number_of_members
  Scenario: User opens up table of teams page for first time, and teams should be sorted in descending order by default
    Given I open up teams page
    Then I should see "Karl Hayek, Brandon Jabr, Carina Boo" before "Derek Hsiao, Ken Chiu"
    And I should see "Derek Hsiao, Ken Chiu" before "George Su"
    And I should see "Hadi Zhang, George Poo" before "George Su"
  
  # Sort listing by number of group members in ascending order, when it was in descending order before
  Scenario: A user wants to sort teams by the number of group members, while it is in descending order
    Given I press the number_of_members heading, while in descending order
    # Should change to ascending order and sort
    Then I should see "George Su" before "Hadi Zhang, George Poo"
    And I should see "George Su" before "Derek Hsiao, Ken Chiu"
    And I should see "Hadi Zhang, George Poo" before "Karl Hayek, Brandon Jabr, Carina Boo"
    And I should see "Derek Hsiao, Ken Chiu" before "Karl Hayek, Brandon Jabr, Carina Boo"
    
  # Sort listing by number of pending requests in descending order, when it was unordered before
  Scenario: A user wants to sort teams by the number of pending requests, while it is unordered
    Given I press the number_of_pending_requests heading, while unordered
    # Should change to descending order and sort
    Then I should see "Karl Hayek, Brandon Jabr, Carina Boo" before "Derek Hsiao, Ken Chiu"
    And I should see "Derek Hsiao, Ken Chiu" before "Hadi Zhang, George Poo"
    And I should see "Hadi Zhang, George Poo" before "George Su"
    
  # Sort listing by number of pending requests in ascending order, when it was in descending order before
  Scenario: A user wants to sort teams by the number of pending requests, while it is in descending order
    Given I press the number_of_pending_requests heading, while unordered
    # Should change to ascending order and sort
    Then I should see "George Su" before "Hadi Zhang, George Poo"
    And I should see "Hadi Zhang, George Poo" before "Derek Hsiao, Ken Chiu"
    And I should see "Derek Hsiao, Ken Chiu" before "Karl Hayek, Brandon Jabr, Carina Boo"
    
  # Filter listing by whether all team members are declared CS/EECS
  Scenario: A user wants to filter teams based on whether all team members are declared CS/EECS majors
    Given I press the declared filter
    Then I should see "Derek Hsiao, Ken Chiu"
    And I should see "Karl Hayek, Brandon Jabr, Carina Boo"
    And I should not see "George Su"
    And I should not see "Hadi Zhang, George Poo"
    
  # Search feature to find team with certain member's name
  Scenario: A user searches for a team with a certain member
    Given I type "George" into the "search bar"
    When I press the submit button
    Then It should display the teams with "George Su" and "George Su" as members
    
  # Link to team profile page when you click on the team's row
  Scenario: A user wants to visits a team's profile page
    Given I press on row 2
    Then I visit the team profile of the team on row 2
    
  # User can join teams
  Scenario: User wants to join a team
    Given I press join team
    Then I am linked to a page to send a join team message request
    
  # User can leave team
  Scenario: User wants to leave a team
    Given I press "Leave"
    Then I leave my team
    And it displays a message saying "You have left your team."
    
  # User can cancel join requests
  Scenario: User wants to cancel a request to join a team
    Given I press cancel request
    Then I cancel my join request