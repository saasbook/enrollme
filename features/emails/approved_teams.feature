Feature: Email an admin information about approved teams
  As an admin
  In order to check on CS 169 enrollment
  I want to receive an email with all the teams that have been approved
  
  Background:
    Given the allowed team size is 5-6
    And I am on the login page
    And I log in as an admin with email "enrollmeberkeley@gmail.com"

  Scenario: Successfully create an account with my name and email
    When I follow "Email me this data"
    And I should see "Welcome Back, EnrollMe!"
    
  Scenario: Successfully emails an admin when they've been invited with a link to the site
    When I follow "Register New Admin"
    Then I should see "Create a New Admin"
  
