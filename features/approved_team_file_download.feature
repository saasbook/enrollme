Feature: get a csv with the information of all approved teams

  As an administrator
  So that I can see all approved students and teams
  I want to download all that information from my home page
  
  Background:
    Given the following users exist
     | name  |       email                    | password   |team_passcode | major           | sid  |
     | Sahai | eecs666@hotmail.com            | mypassword | penguindrool | EECS            | 000  |
     | Saha2 | eecs667@hotmail.com            | mypassword | penguindrool | EECS            | 001  |
     | Saha3 | eecs668@hotmail.com            | mypassword | penguindrool | EECS            | 002  |
     | Saha4 | eecs669@hotmail.com            | mypassword | penguindrool | EECS            | 003  |
  	 | Jorge | legueoflegends667@hotmail.com  | password1  | penguindrool | Football Player | 999  |
  	 | Kandi | justanotheremail@aol.com       | myname555  | anotherteam  | EECS            | 967  |
  	 | Kand2 | justanotheremai2@aol.com       | myname555  | anotherteam  | EECS            | 968  |
  	 | Kand3 | justanotheremai3@aol.com       | myname555  | anotherteam  | EECS            | 969  |
  	 | Kand4 | justanotheremai4@aol.com       | myname555  | anotherteam  | EECS            | 970  |
  	 | Kand5 | justanotheremai5@aol.com       | myname555  | anotherteam  | Football Player | 971  |
  	 | Someo | blahblah@aol.com               | noone      | 0            | EECS            | 567  |
  	And PENDING: the following admins exist
  	 | name  | email                  | password |
  	 | Bob   | supreme_ruler@aol.com  | ilikcats |
    And PENDING: I log in with email "supreme_ruler@aol.com"
  	And PENDING: the team with passcode "penguindrool" is approved
  	And PENDING: the team with passcode "anotherteam" is submitted

  Scenario: An admin successfully downloads approved team information
  	Given PENDING: I press "Download Team Information"
  	Then PENDING: The downloaded file should contain "Sahai"
  	Then PENDING: The downloaded file should not contain "Kandi"
  	Then PENDING: The downloaded file should contain "Someo"
    