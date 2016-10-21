Feature: navigating to the team page without the correct permissions should fail me.
  
  Background: users have been added to database
  	Given the following users exist:
  		| Name                   | Major           | SID  | Email                         | Password    |
  		| John                   | Gender Studies  | 666  | papajohn@berkeley.edu         | 1           |
  		| Josh                   | CS              | 420  | legueoflegends666@berkeley.edu| 2           |
  		| Jorge                  | Football Player | 999  | legueoflegends667@berkeley.edu| 3           |
 	  	| Sahai                  | EECS            | 000  | eecs666@berkeley.edu		  | 4           |
  
   Scenario: I should see team members
        Given I am on the home page
        And I follow "My Team"
        Then I should not see "Students"
        And I should see "Your team does not exist."
        And I should see "Your team does not have any members."

