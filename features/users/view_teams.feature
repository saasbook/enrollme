Feature: view teams
	As a student,
	I want to see a list of teams that can be joined (not full).
	So that I know which teams I am allowed to join.

	Background:
    Given the following users exist
     | name  |       email                    |team_passcode | major           | sid  | skills     |
 	 | Sahai | eecs666@hotmail.com            | penguindrool | EECS            | 000  | JavaScript | 
  	 | Jorge | legueoflegends667@hotmail.com  | penguindrool | Football Player | 999  | Back-end   |
  	 | Kandi | justanotheremail@aol.com       | anotherteam  | EECS            | 567  | CSS        |


	Scenario: A user is looking for a team
	Given I log in as a user with email "justanotheremail@aol.com"
	And I am on the view teams page
	Then I should see "Team: penguindrool"
	And I should see "Contact via email"
	And I should see "Team Size: 2"
	And I should see "Skills: JavaScript, Back-end, CSS"

