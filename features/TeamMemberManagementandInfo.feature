Feature: remove or add team members
  
  Background: users have been added to database
  	Given the following users exist:
  		| Name                   | Major           | SID  | Email                         |
  		| John                   | Gender Studies  | 666  | papajohn@berkeley.edu         |
  		| Josh                   | CS              | 420  | legueoflegends666@berkeley.edu|
  		| Jorge                  | Football Player | 999  | legueoflegends667@berkeley.edu|
 	  	| Sahai                  | EECS            | 000  | eecs666@berkeley.edu		  |
 

        Given I am on the login page
	    Given Josh logs in
        
       
        
        
        
   Scenario: I should see team members
        Given I am on the home page
        Then I should see "Students"
        Then I should see "John"
        Then I should see "Josh"
        Then I should see "Jorge"
        
    Scenario: I should see approval status
        When I am on the home page
        Then I should see "Josh"
        Then I should see "Josh - Approved!"
        Then I should not see "John - Approved"
        Then I should see "John"
        Then I should see "Jorge"
        
    Scenario: I should be able to kick bad team members
        When I press "Remove Jorge"
        Given I am on the home page
        Then I should not see "Jorge"
