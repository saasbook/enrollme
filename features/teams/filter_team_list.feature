Feature: display list of teams filtered by declared CS/EECS teams
  
  As a student
  So that I can quickly browse teams based on my preferences
  I want to see only declared teams or undeclared teams
 
Background: teams have been added to database
  
    Given the following teams exist:
    | group_members | num_members | num_pending_requests | declared | request |
    | George Su | 1 | 0 | No | Invite |
    | Derek Hsiao, Ken Chiu | 2 | 2 | Yes | Leave |
    | Hadi Zhang, George Poo | 2 | 1 | No | Join |
    | Karl Hayek, Brandon Jabr, Carina Boo | 3 | 10 | Yes | Join |
    And the following users exist
     | name  | email                         | team_passcode | major           | sid |
     | Jorge | legueoflegends667@hotmail.com | 0             | Football Player | 999 |
    And I am on the login page
    And I log in as a user with email "legueoflegends667@hotmail.com"
    
    And  I am on the Team List page
    
Scenario: restrict to CS/EECS declared teams
    When I check "declared"
    Then I should see "Derek Hsiao, Ken Chiu"
    And I should not see "George Su"
    
Scenario: no restriction
    When I uncheck "undeclared"
    Then I should see "Derek Hsiao, Ken Chiu"
    And I should see "George Su"