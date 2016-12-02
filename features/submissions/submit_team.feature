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
    And I am on the team "1" page
    Then I should not see the "Submit" button
    
  Scenario: Submit button should be present when team has five or more members, and warning should be displayed
    Given I log in as a user with email "eecs666@hotmail.com"
    And the following discussions exist
      | number  | time             | day        | capacity |
   	  | 54321   | 3:00 PM          |  Tuesday   | 25       |
   	  | 54322   | 3:00 PM          |  Wednesday | 25       |
   	  | 54323   | 3:00 PM          | Thursday   | 25       |
   	And I am on the team "2" page
    Then I should see the "Submit" button
    And I should see "Warning: You need to submit your team"

  Scenario: Successfully choose discussions and submit team for approval
    Given I log in as a user with email "eecs666@hotmail.com"
    And the following discussions exist
      | number  | time             | day        | capacity |
   	  | 54321   | 3:00 PM          |  Tuesday   | 25       |
   	  | 54322   | 3:00 PM          |  Wednesday | 25       |
   	  | 54323   | 3:00 PM          | Thursday   | 25       |
   	And I am on the team "2" page
   	When I press "Submit"
    And I select "CCN: 54321 | Time: Tuesday 3:00 PM | Enrolled: 0 / 25" from "submission[disc1id]"
    And I select "CCN: 54322 | Time: Wednesday 3:00 PM | Enrolled: 0 / 25" from "submission[disc2id]"
    And I select "CCN: 54323 | Time: Thursday 3:00 PM | Enrolled: 0 / 25" from "submission[disc3id]"
    And I press "Submit"
    Then I should see "Thanks for submitting your team for enrollment."
    And I should see "My Team"
    
  Scenario: There are no discussions that can take a user's team
    Given I log in as a user with email "eecs666@hotmail.com"
    Then I should see "There are no available discussions."
    
  Scenario: There is exactly one discussion that can take a user's team
    Given I log in as a user with email "eecs666@hotmail.com"
    And the following discussions exist
      | number  | time             | day        | capacity |
   	  | 54321   | 3:00 PM          |  Tuesday   | 25       |
   	And I am on the team "2" page
    When I press "Submit"
    And I select "CCN: 54321 | Time: Tuesday 3:00 PM | Enrolled: 0 / 25" from "submission[disc1id]"
    When I press "Submit"
    Then I should see "Team has been submitted!"
    And I should see "Selected Discussion Sections CCN: 54321 Time: Tuesday, 3:00 PM"

  Scenario: User cannot choose two of the same discussion
    Given I log in as a user with email "eecs666@hotmail.com"
    And the following discussions exist
      | number  | time             | day        | capacity |
   	  | 54321   | 3:00 PM          |  Tuesday   | 25       |
   	  | 54322   | 3:00 PM          |  Wednesday   | 25       |
   	  | 54323   | 3:00 PM          |  Thursday   | 25       |
   	And I am on the team "2" page
    When I press "Submit"
    And I select "CCN: 54321 | Time: Tuesday 3:00 PM | Enrolled: 0 / 25" from "submission[disc1id]"
    And I select "CCN: 54321 | Time: Tuesday 3:00 PM | Enrolled: 0 / 25" from "submission[disc2id]"
    And I select "CCN: 54321 | Time: Tuesday 3:00 PM | Enrolled: 0 / 25" from "submission[disc3id]"
    And I press "Submit"
    Then I should see "Please choose 3 different discussions"
