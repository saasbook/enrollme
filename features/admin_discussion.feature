Feature: admin adds discussion times
  As an admin
  In order for students to sign up for discussion
  I want to add discussion times
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    And I am on the login page

  Scenario: Admin successfully goes to a new admin discussion list page
    Given: I fill in "Email" with "supreme_ruler@aol.com"
    And: I fill in "Password" with "ilikcats"
    And: I press "Log In"
    #Given: I log in as an admin with email "supreme_ruler@aol.com"
    #Then: I should see "Team List"
    #When: I press "Upload Discussions"
    #Then: I should see "Discussion Sections"

    
  Scenario: Admin successfully adds discussion times
    # Given PENDING: I fill in "Email" with "supreme_ruler@aol.com"
    # And PENDING: I fill in "Password" with "ilikcats"
    # And PENDING: I press "Log In"
    Given PENDING: I log in as an admin with email "supreme_ruler@aol.com"
    When PENDING: I click on "add disscussion times"
    And PENDING: I fill in "CCN" with "#{discussion[:ccn]}"
    And PENDING: I select "#{discussion[:times]}" from "Times"
    And PENDING: I press "Add Discussion"
    Then PENDING: I should see "discussion added"
    
  Scenario: Admin deletes discussion time he accidentally added
    # Given PENDING: I fill in "Email" with "supreme_ruler@aol.com"
    # And PENDING: I fill in "Password" with "ilikcats"
    # And PENDING: I press "Log In"
    Given PENDING: I log in as an admin with email "supreme_ruler@aol.com"
    When PENDING: I click on "add disscussion times"
    And PENDING: I fill in "CCN" with "#{discussion[:ccn]}"
    And PENDING: I select "#{discussion[:times]}" from "Times"
    And PENDING: I press "Delete Discussion"
    Then PENDING: I should see "discussion deleted"
    
    
  Scenario: A non-admin fails to add discussion times
    Given PENDING: I fill in "Email" with "legueoflegends667@hotmail.com"
    And PENDING: I fill in "Password" with "password1"
    And PENDING: I press "Log In"
    
    When PENDING: I go to the approve team "1" page
    Then PENDING: I should see "Permission denied"
    And PENDING: I go to the disapprove team "1" page
    Then PENDING: I should see "Permission denied"
