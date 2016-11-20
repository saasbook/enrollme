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
   	 | 54322   | Wed, 3pm     |  25       |
   	 | 54323   | Thurs, 3pm   |  25       |
    And I am on the login page

  Scenario: Successfully choose a discussion
    Given I log in as a user with email "eecs666@hotmail.com"
    When I press "Submit"
    Then I select "Tues, 3pm" from "submission[disc1id]"
    And I select "Wed, 3pm" from "submission[disc2id]"
    And I select "Thurs, 3pm" from "submission[disc3id]"
    And I press "Submit"
    Then I should see "Thanks for submitting your team for enrollment."
    And I should see "My Team"
