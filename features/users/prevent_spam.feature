Feature: Prevent Spam
  	As a team
	So that I don't get spammed with contact emails
	I want each user to be limited to a few contact emails

  Background:
    Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  | skill      |
     | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | JavaScript |
     | Saha1 | eecs667@hotmail.com            | penguindrool | EECS            | 001  | Back-end   |
     | Jorge | legueoflegends667@hotmail.com  | 0            | Football Player | 999  |            |
    Given I am on the home page
    Given I log in as a user with email "legueoflegends667@hotmail.com"
    And I am on the team list page

  Scenario: User can still email
    Given I contact "Team 1" with the message "I would like to join your team"
    Then I should see "Email sent successfully."

  Scenario: User has reached spam limit
    Given I contacted "Team 1" the max number of times
    Given I contact "Team 1"
    Then I should see "Reached email limit. Please contact a system administrator."
