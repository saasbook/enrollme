Feature: Number of seats open for discussions
  
  As an student user or admin
  I should see the correct number of seats open in discussions

  Background: users have been added to database
    Given the following users exist
        | name  | email                         | team      | major           | sid |
        | Jorge | legueoflegends667@hotmail.com | passcode1 | Football Player | 999 |
        | Bob0  | bobjones0@berkeley.edu        | passcode1 | Slavic Studies  | 824 |
        | Bob1  | bobjones1@berkeley.edu        | passcode1 | Slavic Studies  | 825 |
        | Bob2  | bobjones2@berkeley.edu        | passcode2 | Slavic Studies  | 826 |
        | Bob3  | bobjones3@berkeley.edu        | passcode2 | Slavic Studies  | 827 |
        | Sahai | eecs666@hotmail.com           | passcode2 | EECS            | 000 |
    And the following discussions exist
      | number | time    | day       | capacity |
      |  54321 | 3:00 PM | Tuesday   |       25 |
      |  54322 | 3:00 PM | Wednesday |       25 |
      |  54323 | 3:00 PM | Thursday  |       25 |
    Given the following admins exist
      | name | email                    | superadmin   |
  	  | Bob  | supreme_ruler@gmail.com  | false        |
  	  | Kobe | kobe@gmail.com           | true         |
  	And I am on the login page
    
  Scenario: Correct number of available seats for admin  
    Given I log in as an admin with email "kobe@gmail.com"
    And the team with passcode "passcode1" is approved with discussion number "54321"
    And I press "Discussions"
    Then I should see "21"
    
  Scenario: Correct number of available seats for user  
    Given I log in as an admin with email "eecs666@hotmail.com"
    And the team with passcode "passcode2" is approved with discussion number "54321"
    And I press "Discussions"
    Then I should see "21"