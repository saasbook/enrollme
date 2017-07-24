Feature: display all the teams
  As a user
  In order to find an open team that suits my preferences
  I want to see all the currently open teams and be able to view, sort, and join/leave them
  
Background: teams have been added to database

  Given the following users exist
    |name              |email               |major |sid         |team_id  |waitlisted |
    |Edsgar Dijkstra   |dijkstra@gmail.com  |'CS'  |11111111    |1        |"true"     |
    |John Von Neuman   |neuman@gmail.com    |'CS'  |11111112    |2        |"true"     |
    |Kurt Godel        |godel@gmail.com     |'CS'  |11111113    |3        |"true"     |


    And I am on the login page
    And I follow "Team List"
    
    Scenario: view different teams
      Then show me the page
      Then I should see "Dijkstra"