Feature: submit and info for teams
  
  Background: users have been added to database
  	Given PENDING: the following users exist
  		| Name                   | Major           | SID  | Email                         |
  		| John                   | Gender Studies  | 666  | papajohn@berkeley.edu         |
  		| Josh                   | CS              | 420  | legueoflegends666@berkeley.edu|
  		| Jorge                  | Football Player | 999  | legueoflegends667@hotmail.com |
 	  	| Sahai                  | EECS            | 000  | eecs666@hotmail.com			  |

	Given PENDING: I am on the login page
	Given PENDING: Josh logs in


  Scenario: See team password
    Given PENDING: I am on the home page
    Then PENDING: I should see "Team Password"
            
  Scenario: See Telebears/Calcentral CCN if approved
    Given PENDING: I am on the home page
    Then PENDING: I should see "Final Approval"
    Then PENDING: I should see "CalCentral CCN"
    
  Scenario: See Discussion info if approved
    Given PENDING: I am on the home page
    Then PENDING: I should see "Final Approval"
    Then PENDING: I should see "Discussion Assignments"
    
  Scenario: Submit a team if enough members (happy path)
    Given PENDING: I am on the home page
    When PENDING: I count more than 4 members in students_table
    Then PENDING: I press "Submit Team"
    And PENDING: I should see "Team submitted!"
    
  Scenario: Not Submit a team if not enough members
    Given PENDING: I am on the home page
    When PENDING: I count less than 5 members in students_table
    Then PENDING: I press "Submit Team"
    Then PENDING: I should not see "Team submitted!"
    And PENDING: I should see "ERROR! you must have more than four people on a team"