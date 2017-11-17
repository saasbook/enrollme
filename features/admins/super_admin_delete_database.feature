Feature: Super admin deletes all data

  As a super admin
  So that I can prepare for a new semester of enrollment
  I want to be able to delete the entire database

  Background:
    Given the following admins exist
      | name | email                  | superadmin |
  	  | Bob  | supreme_ruler@aol.com  | true       |
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
    And I log in as an admin with email "enrollmeberkeley@gmail.com"

  Scenario: Super admin successfully deletes everything from database
    When I follow "Reset Semester"
    Then I should see "Warning: Resetting the semester will result in all users, teams, and discussions being deleted."
    And I should see "Password"
    When I fill in "reset_password" with the correct password
    And I press "Reset"
    # Then I should see "All data reset"
    # And I should not see "Jorge"
    # When I press "Discussions"
    # Then I should not see "54321"
