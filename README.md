# EnrollMe

[![Code Climate](https://codeclimate.com/github/adnanhemani/enrollme/badges/gpa.svg?)](https://codeclimate.com/github/adnanhemani/enrollme)
[![Test Coverage](https://codeclimate.com/github/adnanhemani/enrollme/badges/coverage.svg?)](https://codeclimate.com/github/adnanhemani/enrollme/coverage)
[![Build Status](https://travis-ci.org/adnanhemani/enrollme.svg?branch=master)](https://travis-ci.org/adnanhemani/enrollme)


Copyright (c) 2016 Jason Gao, Adnan Hemani, David Koh, Sid Masih, Varun Mathuria, Dasol Yoon

*Pivotal Tracker* https://www.pivotaltracker.com/n/projects/1886001

Michael-David Sasson, Berkeley’s CS enrollment coordinator, would like a tool that students can use to submit requests for their teams to be enrolled into CS 169. Students will be able to specify their team members and submit information like SID and major which will be used to process enrollment. There currently does not exist a website.

Deployed App: https://enrollme.herokuapp.com/

The app will not work locally (at least, logging in specifically) unless you add your specific redirect URL to Google API credentials. This is only possible if you have access to the enrollmeberkeley at gmail.com account, which the next team in charge of this project will possess. To add your redirect URL, go to https://console.developers.google.com/apis/credentials, signed in with the enrollmeberkeley account, go to the edit page for the EnrollMe oauth client, and add your URL to the list of authorized redirect URLs. If you have any questions or confusions, feel free to contact at v.mathuria at berkeley.edu or adnan.h at berkeley.edu.
