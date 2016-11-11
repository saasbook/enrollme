Feature: submit team correct behavior
  
  As an student user
  In order to enroll my team when eligible
  I want to see the right message when I first create a team
  
  Background:
    Given PENDING: I am on the new_user page
    
  Scenario: I start a team
    Given PENDING: I press "Sign Up"
    And PENDING: I fill in "Name" with "Bob Jones"
    And PENDING: I fill in "Email" with "jonesbob@berkeley.edu"
    And PENDING: I fill in "Password" with "bobeecs"
    And PENDING: I fill in "Sid" with "825825"
    And PENDING: I fill in "Major" with "Computer Science"
    And PENDING: I press "Submit"
    And PENDING: I press "Create a Team"
    Then PENDING: I should not see "Team has been submitted!"
    