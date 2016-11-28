Feature: Admin gets help
  As an admin
  I want to get help on how to use this website as an admin
  I want to click a button that brings me to an info page
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: User successfully finds help 
    When I follow "Help"
    Then I should see "Basic Tutorial"
   

