Feature: admin edits discussion times
  As an admin
  In order to account for course changes
  I want to edit discussion times and capacities
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Admin successfully edits a discussion
    Given I am on the discussion_index page
    Then I should see "54321 Tues, 3pm 25"
    When PENDING: I press "edit_1"
    And PENDING: I select "Monday" from "day"
    And PENDING: I fill in "time" with "4pm"
    And PENDING: I fill in "capacity" with "10"
    And PENDING: I press "Make Changes"
    Then PENDING: I should see "Discussion Sections"
    And PENDING: I should see "54321 Monday 4pm 10"
