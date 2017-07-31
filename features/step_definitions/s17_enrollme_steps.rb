# Declarative step to populate DB with teams

Given /^the following teams exist:$/ do |teams_table|
    teams_table.hashes.each do |hash|
    Team.create hash
  end
end

Given /I? type "(.*)"/ do |text|
  puts text
end

Given /I? click the following fields: (.*)/ do |fields|
  click(fields)
end

Given /I? click the (.*) text field/ do |field|
  click(field)
end

Given /I? upload the image (.*)/ do |image|
  pending
end

Then /I? should see the image (.*)/ do |image|
  expect(page.body.index(image))
end

Then /I? should see the file (.*)/ do |file|
  expect(page.body.index(file))
end

Given /I? check the following fields: (.*)/ do |fields|
  fields.split(',').each do |field|
    check "#{field}"
  end
end


################ Team Listing Step Defs ####################
Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  first = page.body.index(e1)
  second = page.body.index(e2)
  expect(first < second)
end

Given /I? check the (un?)declared filter/ do |undeclared|
  if undeclared
    check("undeclared") # name of checkbox depends on what you tag it in html file, so tag accordingly
  else
    check("declared")
  end
end

Given /I press on row \d*/ do |row_num|
  # Click on the team in row #{row_num} of the table
  pending
end

Then /I visit the team profile of the team on row \d*/ do |row_num|
  # @team_id =  # Set instance variable @team_id to equal the id of the team in that row on the table, then redirect to the url of that team's profile
  pending
end

Given /I? press the (.*) heading, while (.*)/ do |heading, prev_order|
  # Check if the heading was in descending, ascending, or unordered before somehow;
  # Perhaps split this step into 2 steps: Given I press the (.*) heading, And the heading is in (.*) order
  pending
end

Given /I? press ("[^\"]*" ) team/ do
  # Use web_steps "press" step to press the button
  # Set instance variable to track the current team_idS
  # Set instance variable to track the current state of the team request variable for user for particular team
  # which we will use in following 3 step defs
  pending
end

Then /I am linked to a page to send a join team message/ do
  # Check that you are linked to page to send join team message for the corresponding team
  pending
end

Then /I cancel my join "request"/ do
  # check that current request to selected team is no longer join
  pending
end

And /it displays ("You have left your team")/ do |message|
  # Check that the message is flashed
  pending
end






################ Email step definitions ################

Then /I should receive a confirmation email at "(.+)"/ do |user_email|
  # this will get the first email, so we can check the email headers and body.
  email = ActionMailer::Base.deliveries.first
  email.from.should include "enrollmeberkeley@gmail.com"
  email.to.should include user_email
  email.subject.should include("Welcome to EnrollMe")
end

And /a confirmation email should be sent to the admin/ do
  # select the emails whose subject match the admin confirmation email's subject
  email = ActionMailer::Base.deliveries.select { |e| e.subject == "A team is awaiting your approval!" }[0]
  email.from.should include "enrollmeberkeley@gmail.com"
  email.to.should include "enrollmeberkeley@gmail.com"
end

And /a confirmation email should be sent to the following team members: "(.+)"/ do |team_members|
  # select the emails whose subject match the team members confirmation email's subject
  email = ActionMailer::Base.deliveries.select { |e| e.subject == "Your team has successfully submitted team enrollment to EnrollMe" }[0]

  email.from.should include "enrollmeberkeley@gmail.com"
  team_members.split(',').each do |member|
    email.to.should include member.strip
  end
end

Then /^I should get an email containing the teams at "(.+)"/ do |admin_email|
   email = ActionMailer::Base.deliveries.select { |e| e.subject.should include "teams currently on EnrollMe!" }[0]
   email.to.should include admin_email
   email.from.should include "enrollmeberkeley@gmail.com"
end


Given(/^I follow the first occurrence of "([^"]*)"$/)  do |link|
    click_link(link, :match => :first)
end
