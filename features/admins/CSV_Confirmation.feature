Feature: Import CSV Page exists and non-waitlested teams are approved
  
  As an admin
  So that I can import a CSV File
  I want to be able to approve non-waitlisted teams
  
  Background:
    Given the following users exist
    | name  |       email                    |team_passcode | major           | sid  |
	   | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | penguindrool | EECS            | 567  |
    And the following admins exist
      | name | email                  |
  	  | Bob  | supreme_ruler@aol.com  |
    And the following discussions exist
  	 | number  | time         |  capacity |
  	 | 54321   | Tues, 3pm    |  25       |
  	And the team with passcode "penguindrool" is submitted
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Import CSV Page Exists
    Given I first follow "Import CSV"
    Then I should be on the import_csv_teams page
  
  Scenario: Import CSV Button Exists and Shows Confirmation Page
    Given I am on the import_csv_teams page
    Then I should see "Import CSV"
    And I upload the following content
        | Name  | Student ID          |User ID       | Role            | Email Address                  | Sections   | Major   | Terms in Attendance   | Units   | Grading Basis   | Waitlist Position  |
	      | Vik   | 24242424            | vik          | Student         | eecs666@hotmail.com            | 99         | EECS    | 4                     | 100     | Letter Grade    | 0                  |
  	    | Jorge | 24242425            | jorge        | Student         | legueoflegends667@hotmail.com  | 99         | EECS    | 4                     | 90      | Letter Grade    | 0                  |   
  	    | Mark  | 24242426            | msun         | Student         | justanotheremail@aol.com       | 99         | EECS    | 4                     | 95      | Letter Grade    | 0                  |
    And I press "IMPORT CSV"
    Then I should see "Successfully approved team id: 1"