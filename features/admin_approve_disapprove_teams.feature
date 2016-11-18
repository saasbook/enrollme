Feature: Approve/Disapprove teams
  As an admin
  In order to make sure legitimate teams are approved
  I want to approve or disapprove teams
  
  Background:
    Given the following admins exist
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
  	And the following users exist
      |   name    |       email                       | team      | major             |       sid         |  
      | Jorge     |    legueoflegends667@hotmail.com  | passcode1 | Football Player   | 999               |
      | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               |
      | Bob2      |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               |
      | Bob3      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               |
      | Bob4      |    bobjones4@berkeley.edu         | passcode1 | Slavic Studies    | 828               |
    And I am on the login page

  Scenario: Admin successfully changes a team's status from approved to disapproved and back
    Given I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    Then I should see "Not Approved"
    When I go to the approve team "1" page
    Then I should not see "Not Approved"
    And I go to the disapprove team "1" page
    Then I should see "Not Approved"
    
  Scenario: A non-admin fails to change a team's status from approved to disapproved and back
    Given I fill in "Email" with "legueoflegends667@hotmail.com"
    And I fill in "Password" with "password1"
    And I press "Log In"
    When I go to the approve team "1" page
    Then I should see "Permission denied"
    And I go to the disapprove team "1" page
    Then I should see "Permission denied"
