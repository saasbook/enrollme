Feature: Checks to see if flag is
  As an admin
  So that I can enroll students in the class
  I want to be able to see if all team members are on the waitlist

  Background:
    Given the allowed team size is 3
    And I am on the login page
    And I log in as an admin with email "enrollmeberkeley@gmail.com"

  Scenario:
    Given that there is a team where all members are not on the waitlist
    And I am on the admin page
    Then I see a flag on the team's row

  Scenario:
    Given that there is not a team where all members are not on the waitlist
    And I am on the admin page
    Then I should not see a flag on the team's row
