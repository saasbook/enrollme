Feature: A user can edit their profile

  As a student
  So that I can update any personal information changes
  I want to be able to change my personal information
  
  Background:
    Given PENDING: the following users exist
     |   name    |       email        | SID        |       major      |
  	 | Jorge                  | Football Player | 999  | legueoflegends667@hotmail.com |
 	 | Sahai                  | EECS            | 000  | eecs666@hotmail.com			  |
    And PENDING: I am logged in as "Jorge"
    
  Scenario: An edit button is on the home page
    When PENDING: I am on the home page
    Then PENDING: I should see "Edit"

  Scenario:
    Given PENDING: I join a team with password "12345"
    And PENDING: I am on the team page
    Then PENDING: I should see "Edit"
    