Feature: admin manages skills that students can add to profile
  As an admin
  In order for students to create a profile
  I want to be able to manage the skills that students can add to their profile.

  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    And I am on the manage skills page

  Scenario: Admin successfully adds a new skill
    Given I fill in "name" with "Frontend"
    And I press "Add"
    Then I should see "Frontend"

  Scenario: Admin prevented from adding a skill that already exists
    Given the following skills exist
     | name  |
     | Frontend   |
     | Backend   |
     | Ruby on Rails  |
     | JS   |
     | React   |
     | Angular   |
     | jQuery   |
    And I fill in "name" with "frontend"
    And I press "Add"
    Then I should see "Skill already exists."
