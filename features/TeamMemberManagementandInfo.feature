Feature: navigating to the team pag
  
  Background: users have been added to database
  	Given PENDING: the following users exist:
  		| Name                   | Major           | SID  | Email                         |
  		| John                   | Gender Studies  | 666  | papajohn@berkeley.edu         |
  		| Josh                   | CS              | 420  | legueoflegends666@berkeley.edu|
  		| Jorge                  | Football Player | 999  | legueoflegends667@berkeley.edu|
 	  	| Sahai                  | EECS            | 000  | eecs666@berkeley.edu		  |
  
   Scenario: I should see team members
        Given I am on the home page
        Then I should not see "Students"
        
