# EnrollMe
![Code Climate](https://codeclimate.com/github/DerekHs/enrollme/badges/gpa.svg?)
![Coverage](https://codeclimate.com/github/DerekHs/enrollme/badges/coverage.svg?)
![Issue Count](https://codeclimate.com/github/DerekHs/enrollme/badges/issue_count.svg?)
![Travis CI](https://travis-ci.org/DerekHs/enrollme.svg?branch=master)


Copyright (c) 2017 Brandon Jabr, Derek Hsiao, Ken Chiu, Hadi Zhang, Karl Hayek, George Su

This repository is a continuation of the original project started from 2016. We plan to add the following features for the following users:

## Students
- Capability to post student profile complete with bio, section availability, resume/LinkedIn, time commitment, and work preferences. Possibly find Facebook friends who are also taking class.
- Integrate all course information into EnrollMe
- Students receive group invitations via email with a button to accept/reject
- Create a search service for connecting individuals to teams or vice versa
- Match students to projects that will likely interest them

## Administrators
- An email is sent to admins whenever a complete team of 6 is formed. Service may be performed by 3rd party mail service such as mailgun
- Store data from semester to semester by compressing it into a .csv
- Handle multiple semesters concurrently 
- Add multiple sections at a time
- Automate process of approving groups. Either with direct integration with CalCentral or through a list of data uploaded by an admin

## Overall:
- Refactor repetitive code
- Increase readability for future teams

*Pivotal Tracker* https://www.pivotaltracker.com/n/projects/1886001
Deployed App: https://enrollme.herokuapp.com/

-------------

Copyright (c) 2016 Jason Gao, Adnan Hemani, David Koh, Sid Masih, Varun Mathuria, Dasol Yoon

*Pivotal Tracker* https://www.pivotaltracker.com/n/projects/1886001

Michael-David Sasson, Berkeley’s CS enrollment coordinator, would like a tool that students can use to submit requests for their teams to be enrolled into CS 169. Students will be able to specify their team members and submit information like SID and major which will be used to process enrollment.

Deployed App: https://enrollme.herokuapp.com/

The app will not work locally (at least, logging in specifically) unless you add your specific redirect URL to Google API credentials. This is only possible if you have access to the enrollmeberkeley at gmail.com account, which the next team in charge of this project will possess. To add your redirect URL, go to https://console.developers.google.com/apis/credentials, signed in with the enrollmeberkeley account, go to the edit page for the EnrollMe oauth client, and add your URL to the list of authorized redirect URLs. If you have any questions or confusions, feel free to contact at v.mathuria at berkeley.edu or adnan.h at berkeley.edu.

## Some information FAQs

#### How to deploy (for Developers)

EnrollMe uses a very standard deployment process. You only need to push to Heroku using git. Don't forget to update your your GitHub repo though!

#### Populate Discussion Sections

Once you're into the admin portal, you should click the "Discussions" button on the Admin homepage. Once you're there, you can click on "Add Discussions" to be on your way to creating new discussion sections in the system. You can use the "Edit Discussions" button to edit existing discussion sections.

#### Basic Maintenance

Add new admins: Click on the "Register New Admin" button on the ribbon at the top of any page in the admin portal.

Manage admins: Click on the "Manage Admins" button on the ribbon at the top of any page in the admin portal. If you are the SuperAdmin, on this new page you'll also see options to transfer your SuperAdmin status to another admin.

Resetting the system for a new semester: Click on the "Reset Semester" button on the ribbon at the top of any page in the admin portal. You'll be asked to put in the master reset password to continue with the process - if you don't remember the password, contact your system administrator for help. The admin requesting this will get an email with all the data that is being wiped from the system. WARNING: there is NO going back once you reset the semester - the data is permanently wiped out of the database after this. Proceed only when you are 100% sure that this is what you want to do.
