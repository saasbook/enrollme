Feature: navigating to the team page without the correct permissions should fail me.
  
  Background: users have been added to database
    Given the following users exist
     |   name    |       email       |team | major        |       sid      |
  		| John         | papajohn@berkeley.edu           |0    | Gender Studies  | 666    |
  		| Josh             | legueoflegends666@berkeley.edu |0    | CS              | 420  |
  		| Jorge       | legueoflegends667@berkeley.edu         | 0  | Football Player | 999  | 
 	  	| Sahai       | eecs666@berkeley.edu          | 0| EECS            | 000  		  |
 	    Given I am on the login page
 	    And I log in as a user with email "papajohn@berkeley.edu"
  
   Scenario: I should see team members
        Given I am on the home page
        Then I should not see "Students"
        And I should be on the without_team page

