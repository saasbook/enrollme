Feature: Ability to add information to profile
	As a student
	I want to add personal information to my profile
	In order to attract people with complementary skillsets

Background: I am creating an account
	Given I am on the new_user page
    And I fill in "Name" with "Oski"
    And I fill in "Email" with "oskibear@berkeley.edu"
    And I fill in "Sid" with "12345678"
    And I select "DECLARED CS/EECS Major" from "major"
    And I choose "user_waitlisted_true"

Scenario: Add bio
	Given I fill in "Bio" with "My name is Oski, I like Ruby"
	When I press "Sign Up"
	And I follow "My Info"
	Then I should see "My name is Oski, I like Ruby"

Scenario: Add Facebook/linkedin
	Given I fill in "Facebook" with "https://www.facebook.com/oski.bear.5"
	When I press "Sign Up"
	And I follow "My Info"
	Then I should see "https://www.facebook.com/oski.bear.5"

Scenario: Specify time commitment
	Given I check the following fields: "Monday", "Evening"
	When I press "Sign Up"
	And I follow "My Info"
	Then I should see "Monday, Evening"

Scenario: Indicate skillset
  
	Given I check the following fields: "Ruby", "CSS"
	When I press "Sign Up"
	And I follow "MyInfo"
	Then I should see "Ruby"
	And I should see "CSS"

# Scenario: Ability to add photo
  
#   	Given I press "Upload Photo"
#   	When I upload "oski.jpg"
# 	And I press "Sign Up"
# 	And I follow "My Info"
# 	Then I should see the image "oski.jpg"

# Scenario: Add Ability to add resume
#   	Given I press "Add Resume"
#   	And I upload "my_resume.txt"
# 	When I press "Sign Up"
# 	And I follow "My Info"
# 	Then I should see the file "my_resume.txt"






