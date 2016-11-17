Feature: submit team correct behavior
  
  As an student user
  In order to enroll my team when eligible
  I want to see the right message when I first create a team
  
  Background:
    Given I am on the new_user page
    
  Scenario: I start a team
    Given I press "Sign Up"
    And I fill in "Name" with "Bob Jones"
    And I fill in "Email" with "jonesbob@berkeley.edu"
    And I fill in "Password" with "bobeecs"
    And I fill in "Sid" with "825825"
    And I select "DECLARED CS/EECS Major" from "major"
    And I press "Sign Up"
    And I press "Create a Team"
    Then I should not see "Team has been submitted!"
    