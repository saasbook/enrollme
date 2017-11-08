Feature: Import CSV Page exists and non-waitlested teams are approved
  
  As an admin
  So that automatically approve teams which have all users on the waitlist
  I want to upload a csv of waitlisted students and automatically assign discussions to approved teams
  
  Background:
    Given the following users exist
     | name        |       email                    | team_passcode | major         | sid     |
 	   | Yonas Kbrom | kbromyonas@gmail.com           | penguindrool  | CS            | 111111  |
  	 | Monty Inaya | mr.monty@gmail.com             | penguindrool  | CS            | 222222  |
  	 | Vikram Baid | vbaid@gmail.com                | penguindrool  | CS            | 333333  |
    And the following admins exist
      | name | email                  |
  	  | Bob  | supreme_ruler@aol.com  |
    And the following discussions exist
   	 | number  | time         |  capacity | seats_open |
   	 | 54321   | Tues, 3pm    |  25       | 25         |
   	And the team with passcode "penguindrool" is submitted
   	And the team with passcode "penguindrool" is not approved
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Import CSV Button Exists and Shows Confirmation Message On Upload
    When I follow "Import Student Data"
    Then I should see "Import Students From CSV"
    When I attach a csv file
    Then I press "Upload Students"
    Then I should see "Users Added Successfully"
    And the team with passcode "penguindrool" should be approved