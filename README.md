# EnrollMe

#[![Code Climate](https://codeclimate.com/github/adnanhemani/enrollme/badges/gpa.svg?)](https://codeclimate.com/github/adnanhemani/enrollme)
#[![Test Coverage](https://codeclimate.com/github/adnanhemani/enrollme/badges/coverage.svg?)](https://codeclimate.com/github/adnanhemani/enrollme/coverage)
#[![Build Status](https://travis-ci.org/adnanhemani/enrollme.svg?branch=master)](https://travis-ci.org/adnanhemani/enrollme)

<a href="https://codeclimate.com/github/rails/rails"><img src="https://codeclimate.com/github/rails/rails/badges/gpa.svg" /></a>

Copyright (c) 2016 Jason Gao, Adnan Hemani, David Koh, Sid Masih, Varun Mathuria, Dasol Yoon

*Pivotal Tracker* https://www.pivotaltracker.com/n/projects/1886001

Michael-David Sasson, Berkeley’s CS enrollment coordinator, would like a tool that students can use to submit requests for their teams to be enrolled into CS 169. Students will be able to specify their team members and submit information like SID and major which will be used to process enrollment. There currently does not exist a website.

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
