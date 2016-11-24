Feature: Super admin deletes all data
  
  As a super admin
  So that I can prepare for a new semester of enrollment
  I want to be able to delete the entire database
  
  Background:
    Given the following admin exists
      | name | email                  | password |
  	  | Bob  | supreme_ruler@aol.com  | ilikcats |
    Given the following users exist
  	  |   name    |       email                       | team      | major             |       sid         |  
	    | Jorge     |    legueoflegends667@hotmail.com  | somepassc | Football Player   | 999               |
	    | Bob0      |    bobjones0@berkeley.edu         | passcode1 | Slavic Studies    | 824               |
	    | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               |
	    | Bob2      |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               |
	    | Bob3      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               |
      | Sahai     |    eecs666@hotmail.com            | passcode1 | EECS              | 000               |
    And the following discussions exist
      | number  | time         | capacity |
   	  | 54321   | Tues, 3pm    |  25      |
   	  | 54322   | Wed, 3pm     |  25      |
   	  | 54323   | Thurs, 3pm   |  25      |
   	And the team with passcode "passcode1" is submitted
   	And I am on the login page
    And I log in as an admin with email "supreme_ruler@aol.com"

  Scenario: Super admin successfully deletes everything from database
    When PENDING: I press "Delete All Data"
    Then PENDING: I should see "Warning: this will delete all users, teams, discussions, and sections"
    And PENDING: I should see "Enter a password to confirm this action"
    When PENDING: I fill in "enrollme"
    And PENDING: I press "Enter"
    Then PENDING: I should see "All data deleted"
    And PENDING: I should not see "Jorge"
    And PENDING: I should not see "Pending"
    When PENDING: I press "Choose Discussions"
    Then PENDING: I should not see "54321"
    