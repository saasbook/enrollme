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

    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Successfully emails all team members when the status changes from unapproved to approved
    When I press "Change Status"
    And I press "Approve"
    Then "bob@gmail.com" should receive "1" email
      
  Scenario: Successfully emails all team members when the status changes from approved to unapproved
    When I press "Change Status"
    And I press "Disapprove"
    Then "bob@gmail.com" should receive "1" email
    