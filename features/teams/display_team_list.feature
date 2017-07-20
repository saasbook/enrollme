Feature: display all the teams
  As a user
  In order to find an open team that suits my preferences
  I want to see all the currently open teams and be able to view, sort, and join/leave them
  
Background: teams have been added to database
  
    Given the following teams exist:
    | group_members | num_members | num_pending_requests | declared | request |
    | George Su | 1 | 0 | No | Invite |
    | Derek Hsiao, Ken Chiu | 2 | 2 | Yes | Leave |
    | Hadi Zhang, George Poo | 2 | 1 | No | Join |
    | Karl Hayek, Brandon Jabr, Carina Boo | 3 | 10 | Yes | Join |
     
#     |pending_requests|declared| request |
     
     
      Given the following users exist
     | name  | email                         | team_passcode | major           | sid | team_id|
     | Derek Hsiao | eecs666@hotmail.com      | penguindrool | EECS            | 000  |     1|
     | Ken Chiu | legueoflegends667@hotmail.com  | penguindrool | EECS           | 001  |      1|

    And I am on the login page
    And I log in as a user with email "legueoflegends667@hotmail.com"
    
    And I am on the Team List page
    
    Scenario: view different teams
      Then I should see "Derek Hsiao, Ken Chiu"
      And  I should not see "Peter"