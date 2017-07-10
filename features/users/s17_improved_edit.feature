Feature: Ability to change personal information
	As a student 
	I want to be able to edit my personal profile
	So that I can correct and update my information

Background: A user exists and is signed in
	Given the following users exist
		|name		|email				|team passcode	|major | sid | bio 		| facebook  | linkedin  | skillset  | photo|
		|Oski		|oskibear@gmail.com	|asdf		 	|CS    | 000 | "asdf"	|  			|  	      	|			|	   |

	Given I am on the login page
	Given I login as a user with email "oskibear@gmail.com"
	Given I click "Edit"

Scenario: Change bio
	Given I click the "Bio" text field
	Given I type "My name is Oski, I like Ruby"
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see "My name is Oski, I like Ruby"

Scenario: Change Facebook/linkedin
	Given I click the "Facebook" text field
	Given I type "https://www.facebook.com/oski.bear.5"
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see "https://www.facebook.com/oski.bear.5"

Scenario: Change time commitment
	Given I click the "Time Commitment" text field
	Given I type "5"
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see "5"

Scenario: Change skillset
	Given I click the following fields: ruby css
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see the following elements: ruby css

Scenario: Change photo
	Given I click "upload photo"
	Given I upload a sample photo
	Given I click "MyInfo"
	Then I should see the photo sample photo

Scenario: Add Ability to add resume
	Given I click "add resume"
	Given I upload the file "my_resume.txt"
	Given I click "MyInfo"
	Then I should see the file "my_reume.txt"