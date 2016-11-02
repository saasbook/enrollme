Feature: Upload/Download files
  As an admin
  In order to get team information
  I want to upload and download course information
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
  	And the following users exist
      |   name    |       email                       | password   | team      | major             | sid |  
      | Jorge     |    legueoflegends667@hotmail.com  | password1  | passcode1 | Football Player   | 999 |
  	And I am on the login page
    And I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
  	
  Scenario: Admin downloads team information
    Given I should see "Welcome Back, Bob!"
    And I press "Download Team Information"
    Then I should have downloaded a team information file
    
  Scenario: Admin uploads bad file
    Given I should see "Welcome Back, Bob!"
    And I upload an invalid file
    Then I should see "File is of wrong format"

  Scenario: Admin uploads a valid file
    Given I should see "Welcome Back, Bob!"
    And I upload a discussion file
    Then I should see "Successfully uploaded file"
    
    
    