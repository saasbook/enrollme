Feature: An admin sends an e-mail

  As an admin
  So that I can update student teams
  I want to be able to send customized e-mails
  
  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
 	 | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | anotherteam  | EECS            | 567  |
    And the following admins exist
      | name | email                  |
  	  | Bob  | supreme_ruler@aol.com  |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Send E-mail button is available and redirects you to the send page
    Given I follow "Send Email"
    Then I should see "Send customized e-mail to team"
  
  Scenario: Fill In TextBox Area, and click Submit
    Given I am on the create_email "1" page
    Then I should see "Send customized e-mail"
    And I fill in "email_content" with "TESTING123"
    And I press "Send Email"
    Then I should see "Successfully sent e-mails"