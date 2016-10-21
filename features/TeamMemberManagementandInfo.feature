# Feature: remove or add team members
  
#   Background: users have been added to database
#   	Given PENDING: the following users exist:
#   		| Name                   | Major           | SID  | Email                         |
#   		| John                   | Gender Studies  | 666  | papajohn@berkeley.edu         |
#   		| Josh                   | CS              | 420  | legueoflegends666@berkeley.edu|
#   		| Jorge                  | Football Player | 999  | legueoflegends667@berkeley.edu|
#  	  	| Sahai                  | EECS            | 000  | eecs666@berkeley.edu		  |
 

#         Given PENDING: I am on the login page
# 	    Given PENDING: Josh logs in
        
       
        
        
        
#   Scenario: I should see team members
#         Given PENDING: I am on the home page
#         Then PENDING: I should see "Students"
#         Then PENDING: I should see "John"
#         Then PENDING: I should see "Josh"
#         Then PENDING: I should see "Jorge"
        
#     Scenario: I should see approval status
#         When PENDING: I am on the home page
#         Then PENDING: I should see "Josh"
#         Then PENDING: I should see "Josh - Approved!"
#         Then PENDING: I should not see "John - Approved"
#         Then PENDING: I should see "John"
#         Then PENDING: I should see "Jorge"
        
#     Scenario: I should be able to kick bad team members
#         When PENDING: I press "Remove Jorge"
#         Given PENDING: I am on the home page
#         Then PENDING: I should not see "Jorge"