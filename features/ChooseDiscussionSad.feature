Feature: When I log in I want to be able to choose my discussion section
  
  Background:
    Given the following users exist
   |   name   |       email                    | password   | team_passcode | major | sid      |
   |   Jorge  | legueoflegends667@hotmail.com  | password1  | ok            | EECS  | 26131973 |
 	 | Sahai    | eecs666@hotmail.com            | mypassword | ok            | EECS  | 26131974 |
 	 | Copy     | anotheremail@hotmail.com       | anotherpsw | ok            | EECS  | 26131975 |
 	 | Charles  | oskithebear@hotmail.com        |  password2 | ok            | EECS  | 26131976 |
 	 | Trump    | wall@hotmail.com               |  password3 | ok            | EECS  | 26131977 |

    And I am on the login page
    And the discussion on Tuesday is not open
    And all these people are on the same team 



  Scenario: Successfully create an account and login
    Given I log in as "Sahai"
    Then I should see "Disucssion Times"
    Then the "Disucssion Times" drop-down should contain the option "10am - Tuesday"
