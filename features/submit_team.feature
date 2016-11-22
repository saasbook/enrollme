Feature: submit team
  
  As an student user
  In order to enroll my team
  I want to be able to submit my team for enrollment consideration
  
  Background: users have been added to database
  	Given the following users exist
  		|   name    |       email                       | team      | major             |       sid         |  
  	    | Jorge     |    legueoflegends667@hotmail.com  | passcode1 | Football Player   | 999               |
  	    | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               |
  	    | Bob2      |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               |
  	    | Bob3      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               |
  	    
    Given I am on the login page
    
  Scenario: Submit button should not be present when team has only four members
    Given I log in as a user with email "leagueoflegends667@hotmail.com"
    Then I should not see "Submit" button
    
  Scenario: Submit button should be present when team has five or more members, and warning should be displayed
    Given the following users exist
        |   name    |       email                       | team      | major             | sid         |
        | Sahai     | eecs666@hotmail.com               | passcode1 | EECS              | 000       |
    And the following discussions exist
        |   number   |       time           | capacity |
        |   111      | Wed 3pm              | 20       |
    
    And I am on the login page
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I should see "Submit" button
    And I should see "Warning:"
    When I press "Submit"
    Then I should see "Choose Discussions"
    When I press "Submit"
    And I should see "Team has been submitted!"