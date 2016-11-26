Feature: student submits their team for approval
  
  As an student user
  In order to submit my team for enrollment consideration when available
  I want to be able to choose discussions and submit my team for approval
  
  Background: users have been added to database
  	Given the following users exist
  		|   name    |       email                       | team      | major             |       sid         |  
	    | Jorge     |    legueoflegends667@hotmail.com  | somepassc | Football Player   | 999               |
	    | Bob0      |    bobjones0@berkeley.edu         | passcode1 | Slavic Studies    | 824               |
	    | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               |
	    | Bob2      |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               |
	    | Bob3      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               |
      | Sahai     | eecs666@hotmail.com               | passcode1 | EECS              | 000       |
    And I am on the login page
    
  Scenario: Submit button should not be present when team has only four members
    Given I log in as a user with email "leagueoflegends667@hotmail.com"
    Then I should not see the "Submit" button
    
  Scenario: Submit button should be present when team has five or more members, and warning should be displayed
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I should see the "Submit" button
    And I should see "Warning: You need to submit your team"

  Scenario: Successfully choose discussions and submit team for approval
    Given I log in as a user with email "eecs666@hotmail.com"
    And the following discussions exist
      | number  | time         | capacity |
   	  | 54321   | Tues, 3pm    |  25      |
   	  | 54322   | Wed, 3pm     |  25      |
   	  | 54323   | Thurs, 3pm   |  25      |
   	When I press "Submit"
    And I select "Tues, 3pm" from "submission[disc1id]"
    And I select "Wed, 3pm" from "submission[disc2id]"
    And I select "Thurs, 3pm" from "submission[disc3id]"
    And I press "Submit"
    Then I should see "Thanks for submitting your team for enrollment."
    And I should see "My Team"
    
  Scenario: There are no discussions that can take a user's team
    Given I log in as a user with email "eecs666@hotmail.com"
    When I press "Submit"
    Then PENDING: I should see "There are no available discussions."
    
  Scenario: There is exactly one discussion that can take a user's team
    Given I log in as a user with email "eecs666@hotmail.com"
    And the following discussions exist
      | number  | time         | capacity |
   	  | 54321   | Tues, 3pm    |  25      |
    When I press "Submit"
    And I select "Tues, 3pm" from "submission[disc1id]"
    And PENDING: I should not be able to select from "submission[disc2id]"
    And PENDING: I should not be able to select from "submission[disc3id]"
    When PENDING: I press "Submit"
    Then PENDING: I should see "Team has been submitted!"
    And PENDING: I should see "Selected Discussion Sections: CCN: 54321 Time: Tues, 3pm"

  Scenario: User cannot choose two of the same discussion
    Given I log in as a user with email "eecs666@hotmail.com"
    And the following discussions exist
      | number  | time         | capacity |
   	  | 54321   | Tues, 3pm    |  25      |
   	  | 54322   | Wed, 3pm     |  25      |
    When I press "Submit"
    And I select "Tues, 3pm" from "submission[disc1id]"
    Then PENDING: I should not see "Tues, 3pm" in "submission[disc2id]"
