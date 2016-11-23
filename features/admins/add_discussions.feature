Feature: admin adds discussion times
  As an admin
  In order for students to sign up for a discussion
  I want to add discussion times
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Admin successfully adds a new discussion
    Given I am on the new discussion page
    When I fill in "ccn" with "12345"
    And I select "Monday" from "day"
    And I fill in "time" with "3pm"
    And I fill in "capacity" with "20"
    And I press "Add Discussion"
    Then I should see "Discussion Sections"
    And I should see "12345 Monday 3pm 20"
  