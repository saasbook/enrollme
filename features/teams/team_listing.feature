Feature: Table for finding and joining teams
  As a user
  In order to find an open team that suits my preferences
  I want to see all the currently open teams and be able to view, sort, and join/leave them
  
  Background:
    Given a listing of teams with the following information
    | group_members | number_of_members | number_of_pending_requests | all_declared | request |
    | George Su | 1 | 0 | No | Join |
    | Derek Hsiao, Ken Chiu | 2 | 2 | Yes | Leave |
  
  # Sort listing by number of group members
  Scenario: A user wants to sort teams by the number of group members, in ascending or descending order
    Given I press the number_of_members heading
    Then the table should sort the team listings by the number of team members, alternating between descending and ascending order
    
  # Sort listing by number of pending requests
  Scenario: A user wants to sort teams by the number of pending requests, in ascending or descending order
    Given I press the number_of_pending_requests heading
    Then the table should sort the team listings by the number of team members, in descending order
    And the table should sort the team listings by the number of pending requests, alternating between ascending and descending order
  
  # Sort listing by whether all team members are declared CS/EECS
  Scenario: A user wants to sort teams based on whether all team members are declared CS/EECS majors
    Given I press the all_declared heading
    Then the table should sort the team listings by the number of team members, in descending order
    And the table should list the teams with declared CS/EECS majors first, then the undeclared majors
    
  # Search feature to find team with certain member's name
  Scenario: A user searches for a team with a certain member
    Given I type a name into the search bar
    When I press the submit button
    Then It should display the teams with that member
    
  # Link to team profile page when you click on the team's row
  Scenario: A user wants to visits a team's profile page
    Given I press on a team's row
    Then I visit the team's profile
    
  # User can join teams
  Scenario: User wants to join a team
    Given I press join team
    Then I am linked to a page to send a join team message request
    
  # User can leave team
  Scenario: User wants to leave a team
    Given I press leave team
    Then I leave my team
    
  # User can cancel join requests
  Scenario: User wants to cancel a request to join a team
    Given I press cancel request
    Then I cancel my join request