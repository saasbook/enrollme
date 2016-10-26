Feature: Send emails
  As an student
  In order to know of changes in the system
  I want to be notified by email under certain conditions
  
  Background: a full team and an admin exist
    Given the following users exist
      |   name    |       email       |password |team | major        |       sid      |
      | John        | papajohn@berkeley.edu           | 0  | 1    | Gender Studies  | 666    |
      | Josh        | legueoflegends666@berkeley.edu | 1 | 1    | CS              | 420  |
      | Jorge       | legueoflegends667@berkeley.edu    | 2| 1  | Football Player | 999  | 
      | Sahai       | eecs666@berkeley.edu          | 3 | 1 | EECS            | 000  		  |
      | Sahai2      | eecs6662@berkeley.edu          | 3 | 1 | EECS            | 001  		  |
      | Sahai3      | eecs6663@berkeley.edu          | 3 | 1 | EECS            | 002  		  |
    
  Scenario: Send an email at 6AM
    When PENDING: the time is 6:00
    Then PENDING: an email is sent to "papajohn@berkeley.edu"
    And PENDING: an email is sent to "legueoflegends666@berkeley.edu"
    And PENDING: an email is sent to "legueoflegends667@berkeley.edu"
    And PENDING: an email is sent to "eecs666@berkeley.edu"
    And PENDING: an email is sent to "eecs6662@berkeley.edu"
    And PENDING: an email is sent to "eecs6663@berkeley.edu"
    
  Scenario: Send an email at 6PM
    When PENDING: the time is 18:00
    Then PENDING: an email is sent to "papajohn@berkeley.edu"
    And PENDING: an email is sent to "legueoflegends666@berkeley.edu"
    And PENDING: an email is sent to "legueoflegends667@berkeley.edu"
    And PENDING: an email is sent to "eecs666@berkeley.edu"
    And PENDING: an email is sent to "eecs6662@berkeley.edu"
    And PENDING: an email is sent to "eecs6663@berkeley.edu"
    
  Scenario: One email to student contain the correct information
    When PENDING: the time is 6:00
    And PENDING: an email is sent to "abc@abc.com"
    Then PENDING: the sent email has "team 1"
    And PENDING: the sent email has "John"
      
