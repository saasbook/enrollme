Feature: Manage requests for joining teams
	As a user
	In order to join with an existing team
	I want to be able to manage my requests to an existing team

	Background: There is a team to join
		Given the following teams exist:
			|approved | passcode | submission_id | submitted | declared | pending_requests 	|
			|"no"     | "bears1"  | False     | 1             | 5           | 0             |
			|"no"     | "bears2"  | False     | 2             | 6           | 0             |

		And the following user exist:

			|team 1| Derek |
			|team 2| An, Hezheng|
			|team 3| George, Karl, Ken|
			|team 4| A, B, C, D, E    |

		And I am on the team_list page

	Scenario: User wants to join a specific team in team list
	When I press the "request" button associated with team "0"
	And I press the requests tab
	Then I should see the people associated with team "0"

	Scenario: Team was merges, not yet full
		IF team 1 was merged with team 3 before request sent
		and I request to join team 1
		and I press requests tab
		then I should see new team with team 1 and team 3 memebers

	Scenario: Team was merged, now full -before request sent
		If team 1 was merged with team 4
		and I request to join team 1
		then I should redirect, flash warning

	Scenario: Team was deleted after request send
		Given I request to join Team 1
		And everyone in Team 1 leaves
		Then I should see flash warning

	Scenario team was merged, now full after request sent
		Given I sent a request to team 1
		Given I sent a request to team 2
		Given your request was accepted by team 1
		Then you should not see anything in outgoing requests

	Scenario, team filled up
		Given I am accepted to team 4
		My incoming requests to should be empty







Scenario: User wants to cancel an outgoing request

Scenario: User wants to



t.string   "name",               null: false
t.string   "email",              null: false
t.string   "major",              null: false
t.string   "sid",                null: false
t.datetime "created_at",         null: false
t.datetime "updated_at",         null: false
t.integer  "team_id"
t.string   "bio"
t.integer  "time_commitment"
t.string   "experience"
t.string   "facebook"
t.string   "linkedin"
t.string   "image_file_name"
t.string   "image_content_type"
t.integer  "image_file_size"
t.datetime "image_updated_at"
end