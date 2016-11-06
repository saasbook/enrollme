Feature: When I log in I want to be able to choose my discussion section
  
  Background:
    Given the following users exist
   |   name   |       email                    | password   | team_passcode | major | sid      |
   |   Jorge  | legueoflegends667@hotmail.com  | password1  | ok            | EECS  | 26131973 |
 	 | Sahai    | eecs666@hotmail.com            | mypassword | ok            | EECS  | 26131974 |
 	 | Copy     | anotheremail@hotmail.com       | anotherpsw | ok            | EECS  | 26131975 |
 	 | Charles  | oskithebear@hotmail.com        |  password2 | ok            | EECS  | 26131976 |
 	 | Trump    | wall@hotmail.com               |  password3 | ok            | EECS  | 26131977 |
  And the following discussions exist
 	 | number  | time         |  capacity |
 	 | 54321   | Tues, 3pm    |  25       |
 	 | 54322   | Wed, 3pm     |  25       |
 	 | 54323   | Thurs, 3pm   |  25       |
    And I am on the login page



  Scenario: Successfully choose a discussion
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
    When I press "Submit"
    Then I select "Tues, 3pm" from "disc1"
    And I select "Wed, 3pm" from "disc2"
    And I select "Thurs, 3pm" from "disc3"
    And I press "Submit"
    Then I should see "Thanks for submitting your team for enrollment."
    And I should see "My Team"
