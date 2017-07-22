Feature: Approve/Disapprove teams
  As an admin
  In order to make sure legitimate teams are approved
  I want to approve or disapprove teams
  
  Background:
    Given the following admins exist
      | name | email                  |
  	  | Robert  | supreme_ruler@aol.com  |
  	And the following users exist
      |   name    |       email                       | team      | major             |       sid         |  waitlisted |
      | Bob       |    bobjones0@berkeley.edu         | passcode1 | Slavic Studies    | 824               | Yes |
      | Bob1      |    bobjones1@berkeley.edu         | passcode1 | Slavic Studies    | 825               | Yes |
      | Bob2      |    bobjones2@berkeley.edu         | passcode1 | Slavic Studies    | 826               | Yes |
      | Bob3      |    bobjones3@berkeley.edu         | passcode1 | Slavic Studies    | 827               | Yes |
      | Bob4      |    bobjones4@berkeley.edu         | passcode1 | Slavic Studies    | 828               | Yes |
      | Sahai     |    xxx@berkeley.edu         | passcode2 | Slav1c Studies    | 830               | Yes |
      | Saha2     |    xx2@berkeley.edu         | passcode2 | Slav1c Studies    | 831               | Yes |
      | Saha3     |    xx3@berkeley.edu         | passcode2 | Slav1c Studies    | 832               | Yes |
      | Saha4     |    xx4@berkeley.edu         | passcode2 | Slav1c Studies    | 833               | Yes |
      | Saha5     |    xx5@berkeley.edu         | passcode2 | Slav1c Studies    | 834               | Yes |
      | Jorge     |    legueoflegends667@hotmail.com  | passcode3 | Football Player   | 999               | Yes |
    And the following discussions exist
   	 | number  | time         |  capacity |
   	 | 54321   | Tues, 3pm    |  25       |
   	 | 54322   | Wed, 3pm     |  25       |
   	 | 54323   | Thurs, 3pm   |  25       |
    And I am on the login page
    And the team with passcode "passcode1" is approved with discussion number "54321"
    And the team with passcode "passcode2" is submitted with discussion numbers "54321", "54322", and "54323"
    
  Scenario: Admin only sees unsubmitted teams under the Forming page
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I follow "Forming"
    Then I should see "Jorge"
    And I should not see "Bob"
    And I should not see "Sahai"
    
  Scenario: Admin only sees submitted (and not approved) teams under the Pending page
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I follow "Pending"
    Then I should not see "Jorge"
    And I should not see "Bob"
    And I should see "Sahai"
    
  Scenario: Admin only sees submitted teams under the Approved page
    Given I log in as an admin with email "supreme_ruler@aol.com"
    When I follow "Approved"
    Then I should not see "Jorge"
    And I should see "Bob"
    And I should not see "Sahai"
    
  Scenario: A non-admin fails to change a team's status from approved to disapproved and back
    Given I log in as a user with email "legueoflegends667@hotmail.com"
    When I go to the approve team "1" page
    Then I should see "Permission denied"
    And I go to the disapprove team "1" page
    Then I should see "Permission denied"
