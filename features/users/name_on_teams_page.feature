Feature: Optional Display Username on Team List Page
    As a user
    So that I can control my anonymity
    I want to be able to choose whether my name is displayed on the team list page.

  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  | skill      | show_name |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | JavaScript | false |
     | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | Back-end   | false |
     | Kandi | justanotheremail@aol.com       | anotherteam  | EECS            | 567  | CSS        | false |
    And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"
    And I follow "My Info"

  Scenario: I want to display my name on the team list page
    Given I follow "Edit"
    And I check "Name Visible to Other Teams" 
    And I press "Update Information"
    And I am on the team list page
    Then I should see "Sahai"

  Scenario: I do not want to display my name on the team list page
    Given I follow "Edit"
    And I uncheck "Name Visible to Other Teams" 
    And I press "Update Information"
    And I am on the team list page
    Then I should not see "Sahai"

