Feature: Ability to add information to profile
	As a student
	I want to add personal information to my profile
	In order to attract people with complementary skillsets

Background: I am creating an account
	Given I click "Sign Up" 

Scenario: Add bio
	Given I click the "Bio" text field
	Given I type "My name is Oski, I like Ruby"
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see "My name is Oski, I like Ruby"

Scenario: Add Facebook/linkedin
	Given I click the "Facebook" text field
	Given I type "https://www.facebook.com/oski.bear.5"
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see "https://www.facebook.com/oski.bear.5"

Scenario: Specify time commitment
	Given I click the "Time Commitment" text field
	Given I type "5"
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see "5"

Scenario: Indicate skillset
	Given I click the following fields: ruby css
	Given I click "submit"
	Given I click "MyInfo"
	Then I should see the following elements: ruby css

Scenario: Ability to add photo
	Given I click "upload photo"
	Given I upload the image "oski.jpg"
	Given I click "MyInfo"
	Then I should see the image "oski.jpg"

Scenario: Add Ability to add resume
	Given I click "add resume"
	Given I upload the file "my_resume.txt"
	Given I click "MyInfo"
	Then I should see the file "my_reume.txt"







