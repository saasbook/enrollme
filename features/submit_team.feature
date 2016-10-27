Feature: submit team
  
  As an student user
  In order to enroll my team
  I want to be able to submit my team for enrollment consideration
  
  Background: users have been added to database
  	Given the following users exist
  		|   name    |       email                       | password              | team      | major             |       sid         |  
  	    | Jorge     |    legueoflegends667@hotmail.com  | password1             | passcode1 | Football Player   | 999               |
  	
    Given I am on the login page
    
  Scenario: Submit button should not be present when team has only four members
    Given I fill in "Email" with "leagueoflegends667@hotmail.com"
    And I fill in "Password" with "password1"
    And I press "Log In"
    Then I should not see "Submit"
    
  Scenario: Submit button should be present when team has five or more members, and warning should be displayed
    Given the following users exist
        |   name    |       email                       | password              | team      | major             | sid         |
        | Sahai     | eecs666@hotmail.com               | mypassword            | passcode1 | EECS              | 000         |
    
    And I am on the login page
    Given I fill in "Email" with "eecs666@hotmail.com"
    And I fill in "Password" with "mypassword"
    And I press "Log In"
    Then I should see "Submit"
    And I should see "Warning:"
    