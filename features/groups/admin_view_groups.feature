Feature: admin can view Group Information

  As an administrator
  So that I can see which teams are paired as a group
  I want to view all pairs of groups
  
  Background:
    And the following discussions exist
   	 | number | time        |  capacity |
   	 | 54321  | Tues, 3pm   |  25       |
   	 | 11211  | Tues, 4pm   |  25       |
   	 | 11212  | Tues, 5pm   |  25       |
   	 | 11213  | Tues, 6pm   |  25       |
    
    Given the following groups exist
     | team1_id |       team2_id    |discussion_id |
     | 1        | 2                 | 2            |
     | 3        | 4                 | 3            |
     | 6        | 5                 | 4            |

  	And the following admins exist
  	 | name  | email                  |
  	 | Bob   | supreme_ruler@aol.com  |


  Scenario: An admin accesses a View Groups page
    Given I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    When I press "View Groups"
    Then I should see "11211"
    And I should see "11212"
    And I should see "11213"