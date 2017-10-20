Feature: Remind team members through email to waitlist themselves in the class
  As an admin
  So that I can remind students to waitlist
  I want to be able to click a button to send a reminder email

  Background:
    Given the allowed team size is 3
    And I am on the login page
    And I log in as an admin with email "enrollmeberkeley@gmail.com"
    And the following users exist
     | Sahai     | eecs666@hotmail.com        | penguindrool | EECS            | 000  |
     | Saha1     | eecs667@hotmail.com        | penguindrool | EECS            | 001  |
     | Saha2     | eecs668@hotmail.com        | penguindrool | EECS            | 002  |

  Scenario:
    Given that all students are not on the waitlist
    And I am on the admin page
    When I press "Remind"
    Then emails should be sent

  Scenario:
    Given that all students are on the waitlist
    And I am on the admin page
    When I press "Remind"
    Then emails should not be sent
