Feature: Email Teams when status changes
  As a team
  In order to check on CS 169 enrollment
  I want to be emailed
  
  Background:
    Given the following users exist
    | name | email                  | team_passcode | major | sid |
  	 | Bob  | bob@gmail.com         | water         | CS    | 1040 |
  	 | Jon  | john@gmail.com        | water         | CS    | 2949 |
  	 | afx  | afx@gmail.com         | water         | CS    | 3848 |
  	 | tony | tony@gmail.com        | water         | CS    | 4747 |
  	 | fox  | fox@gmail.com         | water         | CS    | 5646 |

  Scenario: Successfully emails all team members when the status changes from unapproved to approved
    When PENDING: status is "unapproved"
    And PENDING: admin changes status to "approved"
    Then PENDING: send emails to team members
      
  Scenario: Successfully emails all team members when the status changes from approved to unapproved
    When PENDING: status is "approved"
    And PENDING: admin changes status to "unapproved"
    Then PENDING: send emails to team members