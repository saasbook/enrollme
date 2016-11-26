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
    And PENDING: I choose "3PM" from "time"
    And PENDING: I fill in "capacity" with "20"
    And PENDING: I press "Add Discussion"
    Then PENDING: I should see "Discussion Sections"
    And PENDING: I should see "12345 Monday 3pm 20"
  
  Scenario: Admin prevented from adding a discussion with an already-existing CCN
    Given the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
    And PENDING: I fill in "ccn" with "54321"
    And PENDING: I select "Monday" from "day"
    And PENDING: I choose "3PM" from "time"
    And PENDING: I fill in "capacity" with "20"
    And PENDING: I press "Add Discussion"
    Then PENDING: I should see "This discussion already exists"
    
  Scenario: Admin fails to create a new discussion
    Given PENDING: I fill in "ccn" with "Elmo's World"
    And PENDING: I select "Monday" from "day"
    And PENDING: I choose "3PM" from "time"
    And PENDING: I fill in "capacity" with "Nananana"
    And PENDING: I press "Add Discussion"
    Then PENDING: I should see "Unable to create discussion"
    And PENDING: I should be on the new_discussion page
