Feature: create discussion

  As an admin
  So that I can upload discussions
  I want to successfully upload discussions
  
Background:
    Given the following admins exist
     | name | email                  | password |
  	 | Bob  | supreme_ruler@aol.com  | ilikcats |

  Scenario: An admin cancels editing their information
    Given I am on the login page
    And I fill in "Email" with "supreme_ruler@aol.com"
    And I fill in "Password" with "ilikcats"
    And I press "Log In"
    And PENDING: I press "Add Discussion"
    And PENDING: I fill in "Discussion Time" with "T 9-10 AM"
    And PENDING: I fill in "Number of Seats" with "33"
    And PENDING: I press "Submit"
    Then PENDING: I should see "T 9-10 AM"
    And PENDING: I should see "33"
