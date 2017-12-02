Feature: Enrollme admin cannot reset the semester
  
  As an enrollme admin
  I cannot reset the semester
  
  Background:
    Given the following admins exist
      | name | email                  | superadmin | enrollmeadmin |
  	  | Tim  | sahai@berkeley.edu     | false      |   true        |
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
    And I log in as an admin with email "sahai@berkeley.edu"
  	  
  	Scenario: Enrollme Admin cannot deletes everything from database
  	    When I follow "Home"
  	    Then I should not see "Reset Semester"
  	    
