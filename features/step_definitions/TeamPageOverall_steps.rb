
When /^PENDING: ^(the following users exist)/ do |arg|
  pending
end

# Note: use "0" as team to indicate that this student isn't on a team yet
Given /^the following users exist$/ do |table|
  table.rows.each do |name, email, password, team_passcode, major, sid|
    next if name == "name" # skipping table header
    @team = Team.where(:passcode => team_passcode).first
    if team_passcode != "0"
      @team = Team.create!(:approved => false, :passcode => team_passcode) if @team.nil?
      User.create!(:team => @team, :major => major, :name => name, :email => email, :sid => sid, :password => password)
    else
      User.create!(:team => nil, :major => major, :name => name, :email => email, :sid => sid, :password => password)
    end
  end
end

Then /^(?:|I )should not be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should_not == path_to(page_name)
  else
    assert_not_equal path_to(page_name), current_path
  end
end
  
Then /^print the page body$/ do
  puts page.body
end

Given(/^all the discussions are open$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^all these people are on the same team$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I log in as "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^the discussion on Tuesday is not open$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the "([^"]*)" drop\-down should contain the option "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then /^I should see "([^"]*)" button/ do |name|
  should have_button name
end

Then /^I should not see "([^"]*)" button/ do |name|
  should have_no_button name
end



######################
Given(/^PENDING: the following admins exist$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^PENDING: the time is (\d+):(\d+)$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end



Given(/^PENDING: the following users exist$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^PENDING: I am on the login page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^PENDING: I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^PENDING: I press "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^PENDING: I follow "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^PENDING: I should see "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^PENDING: I should not see "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end



