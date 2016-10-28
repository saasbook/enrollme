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
    And all the discussions are open 
    And all these people are on the same team 



  Scenario: Successfully choose a discussion
    Given I log in as "Sahai"
    Then I should see "Disucssion Times"
    When I select "10am - Tuesday" from "First Choice"
    When I select "10am - Wednesday" from "Second Choice"
    When I select "10am - Friday" from "Third Choice"
    And I press "Submit Team"
    Then I should be on the team page
    Then I should see "Success! Team submitted"
    
