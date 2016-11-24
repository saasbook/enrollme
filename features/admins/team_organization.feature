Feature: Use an admin acccount to see organized team data

  As an admin
  So that I can easily see different teams
  I want to be able to switch between teams with different statuses

  Background:
    Given the following admins exist
     | name | email                  |
  	 | Bob  | supreme_ruler@aol.com  |
    And the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  |
   	 | Copy  | anotheremail@yahoo.com         | ok           | CS              | 009  |
     | Bob0      |    bobjones0@berkeley.edu         | passcode1 | Slavic Studies    | 824               |
     | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               |
     | Bob2      |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               |
     | Bob3      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               |
     | Bob4      |    bobjones4@berkeley.edu         | passcode1 | Slavic Studies    | 828               |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    And the team with passcode "penguindrool" is submitted
    And the team with passcode "passcode1" is approved with discussion number "54321"

  Scenario: A newly disapproved team should not be under the "Approved" category
    Given I follow "Approved"
    Then I should see "Bob0"
    When I follow "disapprove_1"
    And I follow "Approved"
    Then I should not see "Bob0"

  Scenario: A newly approved team should show up under "Approved"
    Given I follow "Approved"
    Then I should not see "Sahai"
    When I follow "Pending"
    And I follow "approve_1"
    And I follow "Approved"
    Then I should see "Sahai"
    
  Scenario: A team with less than 5 members should show up under "Forming"
    Given I follow "all_teams"
    Then I should see "Copy"
    And I should see "Sahai"
    When I follow "Forming"
    Then I should see "Copy"
    And I should not see "Sahai"
    
  Scenario: An admin first sees teams under the "Pending" and "Approved" category only
    Given PENDING: I am on the admin_index page
    Then PENDING: I should see "Bob0"
    And PENDING: I should see "Sahai"
    And PENDING: I should not see "Copy"

  Scenario: The "Pending | Approved" category should only contain teams that are pending or approved
    Given PENDING: I follow "Approved | Pending"
    Then PENDING: I should see "Bob0"
    And PENDING: I should see "Sahai"
    And PENDING: I should not see "Copy"
    
  