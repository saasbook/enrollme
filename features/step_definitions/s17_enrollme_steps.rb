Given /I? type "(.*)"/ do |text|
  pending
end

Given /I? click the following fields: (.*)/ do |fields|
  pending
end

Given /I? upload the image (.*)/ do |image|
  pending
end

Then /I? should see the image (.*)/ do |image|
  pending
end

Then /I? should see the file (.*)/ do |file|
  pending
end

And /the table should list the teams with (?:all)? (.*) first, then (?:the)? (.*)/ do |first, last|
  pending
end

Given /I enter "([^"]*)" into (?:the)? "([^"]*)"/ do |text, field|
  pending
end

Then /It should display the teams with (.*) as members/ do |members|
  pending
end

Given /I press on row (.*)/ do |row_num|
  pending
end

Then /I visit the team profile of the team on (.*)/ do |row_num|
  pending
end

Given /I? press the (.*) heading/ do |heading|
  pending
end

Given /I open up teams page/ do
  pending
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  first = page.body.index(e1)
  second = page.body.index(e2)
  expect(first < second)
end