Feature: navigating to the team page without the correct permissions should fail me.
  
  Background: users have been added to database
    Given the following users exist
     |   name    |       email       |password |team | major        |       sid      |
  		| John         | papajohn@berkeley.edu           | 0  |0    | Gender Studies  | 666    |
  		| Josh             | legueoflegends666@berkeley.edu | 1 |0    | CS              | 420  |
  		| Jorge       | legueoflegends667@berkeley.edu         | 2| 0  | Football Player | 999  | 
 	  	| Sahai       | eecs666@berkeley.edu          | 3 | 0| EECS            | 000  		  |
 	    Given I am on the login page
      And I fill in "Email" with "papajohn@berkeley.edu"
      And I fill in "Password" with "0"
      And I press "Log In"
  
   Scenario: I should see team members
        Given I am on the home page
        Then I should not see "Students"
        And I should be on the without_team page

