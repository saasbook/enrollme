Feature: get the information of all approved teams

  As an administrator
  So that I can see all approved students and teams
  I want to get all that information from my home page
  
  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  | waitlisted |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | true |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  | true |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  | true |
     | Saha4 | eecs669@hotmail.com            | penguindrool | EECS            | 003  | true |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | true |
  	And the following admins exist
  	 | name  | email                  |
  	 | Bob   | supreme_ruler@aol.com  |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
  	And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
  	And the team with passcode "penguindrool" is approved with discussion number "54321"

  Scenario: An admin successfully downloads approved team information as a cvs file
    Given I follow "Download this data"
  	Then I should have downloaded a team information file


  Scenario: An admin succesfully emails to him/herself the teams listed on the page
    Given I follow "Email me this data"
    Then I should get an email containing the teams at "supreme_ruler@aol.com"
    Then I should see "Email successfully sent to supreme_ruler@aol.com"