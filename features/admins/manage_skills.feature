Feature: admin manages skills that students can add to profile
  As an admin,
  I want to be able to manage the skills that students can add to their profile.
  So that I can allow students to add relevant skills to their profile.

  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | eecs666@hotmail.com  | ilikcats |
    And I am on the login page
    And I log in as an admin with email "eecs666@hotmail.com"
    And I am on the skills page

  Scenario: Admin successfully adds a new skill
    Given I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    Then I should see "Skill Frontend successfully created."
    Then I should see "Frontend"

  Scenario: Admin prevented from adding a skill that already exists
    Given I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    And I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    Then I should see "Skill Frontend already exists."
  
  Scenario: Admin edits skill name
     Given I fill in "Skill" with "Frontend"
