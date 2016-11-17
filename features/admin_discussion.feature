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
    Then I should see "Team List"
    When I press "Upload Discussions"
    Then I should see "Discussion Sections"
    
  Scenario: Admin successfully sees add discussion form
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I press "Upload Discussions"
    When I press "Add Discussions"
    Then I should see "Add New Discussion"
    
  Scenario: Admin successfully adds a new discussion
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I press "Upload Discussions"
    And I press "Add Discussions"
    And I fill in "Number" with "12345"
    And I fill in "Day" with "Mon"
    And I fill in "Time" with "3"
    And I fill in "Capacity" with "20"
    And I press "Add Discussion"
    Then I should see "Discussion Sections"
    And I should see "Number" with "12345"
    And I should see "Day" with "Mon"
    And I should see "Time" with "3"
    And I should see "Capacity" with "20"

  
    