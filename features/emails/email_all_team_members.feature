Feature: Email all students on a team with one button.

 As an admin
 So that I can easily email all team members
 I want to be able to click one button and send an e-mail to everyone on a team

 Background:
    Given I clean the database
    Given the following admins exist
    | name | email                  |
 	 | Bob  | supreme_ruler@aol.com  |
    And the following users exist
    | name  |       email                    |team_passcode | major           | sid  | waitlisted |
    | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | true |
    | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  | true |
    | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  | true |
 	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | true |

    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    
@javascript
    Scenario: I should send an e-mail to all team members with one click
     # Given I press the "Email Team" button on the same row as "Sahai"
     Given I follow "Email Team"

     And I fill in "email_subject" with "Welcome"
     And I fill in "email_content" with "I am Bob the supreme ruler"
     And I press "Send"

     Then "eecs666@hotmail.com" should receive 1 email
     And "eecs667@hotmail.com" should receive 1 email
     And "eecs668@hotmail.com" should receive 1 email
     And "legueoflegends667@hotmail.com" should receive 1 email