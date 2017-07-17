Feature: edit user information

  As a student
  So that I can fix any mistakes I made in inputting information
  I want to be able to edit my user information
  
  Background:
    Given the following users exist
     | name    |       email          |team_passcode | major | sid  |
 	   | Sahai   | eecs666@hotmail.com  | penguindrool | EECS  | 000  |
   	And I am on the login page
    And I log in as a user with email "eecs666@hotmail.com"
    And I am on the team "1" page
 	
  Scenario: An existing user edits their information
    Given I should not see "NewName"
    And I should see "Sahai"
    When I follow "My Info"
    And I follow "Edit"
    And I fill in "Name" with "NewName"
    And I press "Update Information"
    Then I should see "NewName"
    
  Scenario: A user cancels editing their information
    Given I should see "Sahai"
    When I follow "My Info"
    And I follow "Edit"
    And I follow "Cancel"
    Then I should see "Sahai"

  Scenario: Change bio
    When I follow "My Info"
    And I follow "Edit"
    And I fill in "Bio" with "My name is Oski, I like Ruby"
    And I press "Update Information"
    And I follow "My Info"
    Then I should see "My name is Oski, I like Ruby"

  Scenario: Change time commitment
    When I follow "My Info"
    And I follow "Edit"
    And I fill in "time commitment" with "1337"
    And I press "Update Information"
    And I follow "My Info"
    Then I should see "1337"

  Scenario: Change experience
    When I follow "My Info"
    And I follow "Edit"
    And I fill in "Bio" with "My name is Oski, I like Ruby"
    And I press "Update Information"
    And I follow "My Info"
    Then I should see "My name is Oski, I like Ruby"

  Scenario: Change bio
    When I follow "My Info"
    And I follow "Edit"
    And I fill in "Bio" with "My name is Oski, I like Ruby"
    And I press "Update Information"
    And I follow "My Info"
    Then I should see "My name is Oski, I like Ruby"

  Scenario: Change bio
    When I follow "My Info"
    And I follow "Edit"
    And I fill in "Bio" with "My name is Oski, I like Ruby"
    And I press "Update Information"
    And I follow "My Info"
    Then I should see "My name is Oski, I like Ruby"
