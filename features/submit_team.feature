Feature: submit team
  
  As an student user
  In order to enroll my team
  I want to be able to submit my team for enrollment consideration
  
  Background: users have been added to database
  	Given PENDING: the following users exist
  		|   name    |       email                       | password              | team      | major             |       sid         |  
  	    | Jorge     |    legueoflegends667@hotmail.com  | password1             | passcode1 | Football Player   | 999               |
  	
    Given PENDING: I am on the login page
    
  Scenario: Submit button should not be present when team has only four members
    Given PENDING: I fill in "Email" with "leagueoflegends667@hotmail.com"
    And PENDING: I fill in "Password" with "password1"
    And PENDING: I press "Log In"
    Then PENDING: I should not see "Submit"
    
  Scenario: Submit button should be present when team has five or more members, and warning should be displayed
    Given PENDING: the following users exist
        |   name    |       email                       | password              | team      | major             | sid         |
        | Sahai     | eecs666@hotmail.com               | mypassword            | passcode1 | EECS              | 000         |
    
    And PENDING: I am on the login page
    Given PENDING: I fill in "Email" with "eecs666@hotmail.com"
    And PENDING: I fill in "Password" with "mypassword"
    And PENDING: I press "Log In"
    Then PENDING: I should see "Submit"
    And PENDING: I should see "Warning:"
    