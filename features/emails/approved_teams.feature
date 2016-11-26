Feature: Email an admin information about approved teams
  As an admin
  In order to check on CS 169 enrollment
  I want to receive an email with all the teams that have been approved
  
  Background:
    Given the following admins exist
     | name | email                       |
  	 | Bob  | enrollmeberkeley@gmail.com  |

    And I am on the login page
    And I log in as an admin with email "enrollmeberkeley@gmail.com"

  Scenario: Successfully create an account with my name and email
    And I follow "Email Me"
    And I should see "Welcome Back, Bob!"
    
  Scenario: Successfully emails an admin when they've been invited with a link to the site
    When PENDING: I follow "Invite New Admin"
    And PENDING: I enter an email "sid.masih@gmail.com" as admin
    And PENDING: I follow "Send Invite"
    Then PENDING: I should see "Email Sent to Sid"
  
  Scenario: Email Me button should send actual email with approved teams attached in CSV
    When PENDING: I follow "Email Me"
    Then PENDING: I should receive an email with a CSV with "approved teams"