Feature: admin adds discussion times
  As an admin
  In order for students to sign up for discussion
  I want to add discussion times
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page

  Scenario: Admin successfully goes to a new admin discussion list page
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I press "Choose Discussions"
    Then I should see "Discussion Sections"
    
  Scenario: Admin successfully sees add discussion form
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I press "Choose Discussions"
    When I press "Add Discussions"
    Then I should see "Add New Discussion"
    
  Scenario: Admin successfully adds a new discussion
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I press "Choose Discussions"
    And I press "Add Discussions"
    Then I should see "Add New Discussion"
    When I fill in "ccn" with "12345"
    And I select "Monday" from "day"
    And I fill in "time" with "3"
    And I fill in "capacity" with "20"
    And I press "Add Discussion"
    Then I should see "Discussion Sections"
    And the team with ccn "12345", day "Monday", time "3", and capacity "20" should exist
  