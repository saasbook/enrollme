Feature: admin edits discussion times
  As an admin
  In order to account for course changes
  I want to edit discussion times and capacities
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And the following discussions exist
   	 | number  | time      | day       |  capacity |
   	 | 54321   | 3:00 PM   | Tuesday   |  25       |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Admin successfully edits a discussion
    Given I am on the discussion_index page
    Then I should see "54321 Tuesday 3:00 PM 25"
    When I press "Edit Discussions"
    And I select "CCN: 54321 | Time: Tuesday 3:00 PM | Enrolled: 0 / 25" from "edit_disc[edit_disc]"
    And I press "Submit"
    And I select "Monday" from "day"
    And I select "2:00 PM" from "time"
    And I fill in "capacity" with "10"
    And I press "Edit Discussion"
    Then I should see "Discussion Sections"
    And I should see "54321 Monday 2:00 PM 10"
