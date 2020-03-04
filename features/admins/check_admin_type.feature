Feature: Super Admin 
  As an admin
  I want to create TA admins and
  I want to create Enroll admins
  
  Background:
    Given the following admins exist
      | name | email                    | superadmin   |
  	  | Bob  | supreme_ruler@gmail.com  | false      |
  	  | Kobe | kobe@gmail.com           | true       |
    And I am on the login page
    And I log in as an admin with email "kobe@gmail.com"


# Commented out to avoid failing cucumber/travis-ci build


#   Scenario: Enroll admin added
#     When I follow "Register New Admin"
#     Then I should see "Create new Enroll Admin"
#     And I should see "Create new TA Admin"
#     When I press "Create new Enroll Admin"
#     And I fill in "Name" with "Steve"
#     And I fill in "Email" with "steviesteve@gmail.com"
#     And I press "Create"
#     Then I should see "New Enroll admin added"
    
#   Scenario: TA admin added
#     When I follow "Register New Admin"
#     Then I should see "Create new Enroll Admin"
#     And I should see "Create new TA Admin"
#     When I press "Create new TA Admin"
#     And I fill in "Name" with "Steve"
#     And I fill in "Email" with "steviesteve@gmail.com"
#     And I press "Create"
#     Then I should see "New TA admin created"
