Feature: display list of teams sorted by different criteria
  
  As a student
  So that I can quickly browse teams based on my preferences
  I want to see teams sorted by num_memberss, num_pending_requests
 
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
    
  Scenario: sorted in descending order by default based on num_members
    Then I should see "Karl Hayek, Brandon Jabr, Carina Boo" before "Derek Hsiao, Ken Chiu"
  
  Scenario: sorted in ascending order by num_members
    When I follow "num_members"
    Then I should see "George Su" before "Hadi Zhang, George Poo"
    
  Scenario: sorted in descending order by number of pending requests
    When I follow "num_pending_requests"
    Then I should see "Karl Hayek, Brandon Jabr, Carina Boo" before "Derek Hsiao, Ken Chiu"
    
  Scenario: sorted in ascending order by number of pending requests
    When I follow "num_pending_requests" #descending order first time
    And I follow "num_pending_requests" #ascending order second time
    Then I should see "George Su" before "Hadi Zhang, George Poo"