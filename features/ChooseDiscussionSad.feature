Feature: When I log in I want to be able to choose my discussion section
  
  Background:
    Given the following users exist
   |   name   |       email                    | team_passcode | major | sid      |
   |   Jorge  | legueoflegends667@hotmail.com  | ok            | EECS  | 26131973 |
 	 | Sahai    | eecs666@hotmail.com            | ok            | EECS  | 26131974 |
 	 | Copy     | anotheremail@hotmail.com       | ok            | EECS  | 26131975 |
 	 | Charles  | oskithebear@hotmail.com        | ok            | EECS  | 26131976 |
 	 | Trump    | wall@hotmail.com               | ok            | EECS  | 26131977 |
 	  And the following discussions exist
 	 | number  | time         |  capacity |
 	 | 54321   | Tues, 3pm    |  25       |
    And I am on the login page


  Scenario: Successfully create an account and login
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I should see "Discussions"
    When I press "Submit"
    Then the "submission[disc1id]" drop-down should contain the option "Tues, 3pm"
