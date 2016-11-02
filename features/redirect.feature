Feature: go to the correct page

  As a student
  So that I know what my team and login status is
  I want to be directed to the correct page
  
  Background:
    Given the following users exist
     | name   |       email                    | password   | team_passcode | major           | sid  |
  	 | Jorge  | legueoflegends667@hotmail.com  | password1  | 0             | Football Player | 999  |
 	 | Sahai  | eecs666@hotmail.com            | mypassword | penguindrool  | EECS            | 000  |
 	 | Copy   | anotheremail@yahoo.com         | anotherpsw | ok            | CS              | 001  |

    And I am on the login page

  Scenario: Correctly redirects to the login page when no one is signed in
    Given I am on the home page
    Then I should see "Log In!"
    
  Scenario: Redirects a user already in a team to their team page
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
    Then I should see "Team Password: penguindrool"

  Scenario: Redirects an already-logged in user to their team page when they try to access the login page
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
    And I am on the login page
    Then I should see "Team Password: penguindrool"
    
  Scenario: A user puts in the wrong username
    Given I fill in "Email" with "wrongemail@yahoo.com"
    And I fill in "Password" with "honk"
    And I press "Log In"
    Then I should see "Invalid email or password"

  Scenario: A user puts in the wrong password
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "honk"
    And I press "Log In"
    Then I should see "Invalid email or password"
    
  Scenario: Successfully log out
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
    Then I press "Logout"
    Then I should be on the home page
    
  Scenario: Prevents access to team page when no one is signed in
    Given I am on the team "1" page
    Then I should see "Log In!"

  Scenario: Prevents access to a team page when a user is not on a team
    Given I fill in "Email" with "legueoflegends667@hotmail.com"
    And I fill in "Password" with "password1"
    And I press "Log In"
    Then I go to the team "1" page
    Then I should see "Your team does not exist"
    
  Scenario: Prevents access to another team's page
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
    Then I go to the team "2" page
    Then I should not be on the team "2" page
    And I should see "Cannot access this team"
    
  Scenario: Prevents access to a non-logged in person
    Given I go to the team "0" page
    Then I should not be on the team "0" page
    And I should see "Please log in"

  Scenario: Successfully leave a team
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
    Then I go to the team "1" page
    And I press "Leave team"
    Then I should be on the without_team page
