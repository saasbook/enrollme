Feature: go to the correct page

  As a student
  So that I know what my team and login status is
  I want to be directed to the correct page
  
  Background:
    Given the following users exist
     | name   |       email                    | team_passcode | major           | sid  |
  	 | Jorge  | legueoflegends667@hotmail.com  | 0             | Football Player | 999  |
   	 | Sahai  | eecs666@hotmail.com            | penguindrool  | EECS            | 000  |
   	 | Copy   | anotheremail@yahoo.com         | ok            | CS              | 001  |
    And the following admins exist
      | name | email                  |
  	  | Bob  | supreme_ruler@aol.com  |

    And I am on the login page

  Scenario: Correctly redirects to the login page when no one is signed in
    Given I am on the home page
    Then I should see "CS 169 EnrollMe"
    
  Scenario: Redirects a user already in a team to their team page
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I should see "Team Password: penguindrool"

  Scenario: Redirects an already-logged in user to their team page when they try to access the login page
    Given I log in as a user with email "eecs666@hotmail.com"
    And I am on the login page
    Then I should see "Team Password: penguindrool"
    
  Scenario: A user puts in the wrong username
    Given I log in as a user with email "wrongemail@yahoo.com"
    Then I should see "Account not created yet, please sign up!"
    
  Scenario: Successfully log out
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I follow "Logout"
    Then I should be on the login page
    
  Scenario: Prevents access to team page when no one is signed in
    Given I am on the team "1" page
    Then I should see "CS 169 EnrollMe"

  Scenario: Prevents access to a team page when a user is not on a team
    Given I log in as a user with email "legueoflegends667@hotmail.com"
    Then I go to the team "1" page
    Then I should see "Permission denied"
    
  Scenario: Prevents access to another team's page
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I go to the team "2" page
    Then I should not be on the team "2" page
    And I should see "Permission denied"
    
  Scenario: Prevents access to a non-logged in person
    Given I go to the team "0" page
    Then I should not be on the team "0" page
    And I should see "Please log in"

  Scenario: Successfully leave a team
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I go to the home page
    And I press "Leave team"
    Then I should be on the without_team page
