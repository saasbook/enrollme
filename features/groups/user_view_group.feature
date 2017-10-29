Feature: a user can view Group Information

  As a user
  So that I can see who are in my group
  I want to view my group members
  
  Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | hihi         | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | hihi         | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | hihi         | EECS            | 567  |
  	And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  24       |
  	And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"
    And the team with passcode "penguindrool" is approved with discussion number "54321"
  	And the team with passcode "hihi" is approved with discussion number "54321"
    And the following groups exist
     | team1_id |       team2_id    |discussion_id  |
     | 1        | 2                 | 1             |
    And 

  Scenario: A user accesses a View My Group page
    Given I press "My Group Page"
    And I log in as an admin with email "supreme_ruler@aol.com"
    When I press "View Groups"
    Then I should see "Sahai"
    And I should see "Saha2"
    And I should see "Saha3"
    And I should see "Saha4"
    And I should see "Jorge"
    And I should see "Kandi"