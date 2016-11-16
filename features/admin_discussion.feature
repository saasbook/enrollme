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
    
  Scenario: Admin successfully adds discussion times
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I press "Upload Discussions"
    # And I fill in "capacity" with "30"
    # And I check "select"
    And I press "Add Discussions"
    Then I should see "Team List"
    