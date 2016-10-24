Feature: remove or add team members
  
  Background: users have been added to database
  	Given the following users exist
  		|   name    |       email                       | password              |team   | major             |       sid         |  
  	    | Jorge     |    legueoflegends667@hotmail.com  | password1             | 0     | Football Player   | 999               |
 	    | Sahai     | eecs666@hotmail.com               | mypassword            | 1     | EECS              | 000               |
 

        Given I am on the login page
        
    Scenario: I should see team members
        Given I am on the login page
        And I fill in "Email" with "eecs666@hotmail.com"
        And I fill in "Password" with "mypassword"
        And I press "Log In"
        Then I should see "Members"
        And I should see "Sahai"
        And I should not see "Jorge"
        
    Scenario: I should be able to leave the team
        Given I am on the login page
        And I fill in "Email" with "eecs666@hotmail.com"
        And I fill in "Password" with "mypassword"
        And I press "Log In"
        And I press "Leave team"
        Then I should see "Create or Join a Team"
        
    # Scenario: I should see approval status
    #     When PENDING: I am on the home page
    #     Then PENDING: I should see "Josh"
    #     Then PENDING: I should see "Josh - Approved!"
    #     Then PENDING: I should not see "John - Approved"
    #     Then PENDING: I should see "John"
    #     Then PENDING: I should see "Jorge"