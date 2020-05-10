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
    And I press "Add Skill"
    And I follow "edit-Frontend"
    And I fill in "Skill" with "Backend"
    And I press "Edit Skill Name"
    Then I should see "Backend skill name updated successfully."
    And I should see "Backend"
    And I should not see "Frontend"
    
  Scenario: Admin deletes skill name
    Given I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    And I follow "delete-Frontend"
    Then I should see "Sucessfully deleted Frontend."
    
  Scenario: Admin edits skill to existing skill
    Given I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    And I fill in "Skill" with "Backend"
    And I press "Add Skill"
    And I follow "edit-Frontend"
    And I fill in "Skill" with "Backend"
    And I press "Edit Skill Name"
    Then I should see "Backend skill already exists." 
    And I should see "Backend"
    And I should see "Frontend"
    
  Scenario: Admin adds skill that was previously deleted
    Given I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    And I follow "delete-Frontend"
    And I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    Then I should see "Skill Frontend successfully created."
    Then I should see "Frontend"
  
  Scenario: Admin edits skill name to be previously deleted skill
    Given I fill in "Skill" with "Frontend"
    And I press "Add Skill"
    And I fill in "Skill" with "Backend"
    And I press "Add Skill"
    And I follow "delete-Frontend"
    And I follow "edit-Backend"
    And I fill in "Skill" with "Frontend"
    And I press "Edit Skill Name"
    Then I should see "Frontend skill name updated successfully."
    
