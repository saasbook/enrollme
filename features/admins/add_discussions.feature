Feature: admin adds discussion times
  As an admin
  In order for students to sign up for a discussion
  I want to add discussion times
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"
    And I am on the new discussion page

  Scenario: Admin successfully adds a new discussion
    Given I fill in "ccn" with "12345"
    And I select "Monday" from "day"
    And I select "3:00 PM" from "time"
    And I fill in "capacity" with "20"
    And I press "Add Discussion"
    Then I should see "Discussion Sections"
    And I should see "12345 Monday 3:00 PM 20"
  
  Scenario: Admin prevented from adding a discussion with an already-existing CCN
    Given the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And I fill in "ccn" with "54321"
    And I select "Monday" from "day"
    And I select "3:00 PM" from "time"
    And I fill in "capacity" with "20"
    And I press "Add Discussion"
    Then I should see "CCN is either already used or is not 5 digits. Please check your inputs and try again."
    
  Scenario: Admin fails to create a new discussion
    Given I fill in "ccn" with "Elmo's World"
    And I select "Monday" from "day"
    And I select "3:00 PM" from "time"
    And I fill in "capacity" with "Nananana"
    And I press "Add Discussion"
    Then I should see "CCN is either already used or is not 5 digits. Please check your inputs and try again."
    And I should see "Add New Discussion"
