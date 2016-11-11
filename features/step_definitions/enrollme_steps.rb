Given /^I log in as an admin with email "([^"]*)"$/ do | email |
  password = Admin.find_by_email(email).password
  step "I am on the login page"
  step %Q{I fill in "Email" with "#{email}"}
  step %Q{I fill in "Password" with "#{password}"}
  step %Q{I press "Log In"}
end

Given /^I log in as a user with email "([^"]*)"$/ do | email |
  password = User.find_by_email(email).password
  step "I am on the login page"
  step %Q{I fill in "Email" with "#{email}"}
  step %Q{I fill in "Password" with "#{password}"}
  step %Q{I press "Log In"}
end

And /^I log out$/ do
  step %Q{I follow "Logout"}
end

When /^I remove "([^"]*)"$/ do | user |
  step %Q{I press "remove_#{user}"}
end

When /^I leave my team$/ do
  step %Q{I press "Leave team"}
end

And /^I join a team with passcode "([^"]*)"$/ do | passcode |
  step %Q{I fill in "team_hash" with "#{passcode}"}
  step %Q{I press "Join"}
end

Given(/^the team with passcode "([^"]*)" is approved with discussion number "([^"]*)"$/) do |passcode, number|
  Team.find_by_passcode(passcode).approve_with_discussion(Discussion.find_by_number(number).id)
end

And /^the team with passcode "([^"]*)" is submitted$/ do | passcode |
  Team.find_by_passcode(passcode).update(:submitted => true)
end

And /^my team is submitted$/ do
  @team.update(:submitted => true)
end

And /^the team with passcode "([^"]*)" should be (.*)$/ do | passcode, status |
  expect(Team.find_by_passcode(passcode).send(status)).to be_truthy
end

And /^the team with passcode "([^"]*)" should not be (.*)$/ do | passcode, status |
  expect(Team.find_by_passcode(passcode).send(status)).to be_falsy
end


Then /^the "([^"]*)" drop-down should contain the option "([^"]*)"$/ do |dropdown, text|
  expect(page).to have_select(dropdown, :options => [text])
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

Given /^the following discussions exist$/ do |table|
  table.rows.each do |number, time, capacity, seats_open|
    next if number == :number # skipping table header
    Discussion.create!(:number => number.to_i, :time => time, :capacity => capacity.to_i)
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


Then /^I should see "([^"]*)" button/ do |name|
  should have_button name
end

Then /^I should not see "([^"]*)" button/ do |name|
  should have_no_button name
end


Given /^the following admins exist$/ do |table|
  table.rows.each do |name, email, password|
    next if name == "name" # skipping table header
    Admin.create!(:name => name, :email => email, :password => password)
  end
end

Then /^I should have downloaded a team information file$/ do
   page.response_headers['Content-Disposition'].should include("team_info.csv")
end

When /^I upload a discussion file$/ do
  attach_file(:discussions, File.join('features', 'test_files', 'discussion_info.csv'))
  click_button "Upload"
end
 
When /^I upload an invalid file$/ do
  attach_file(:discussions, File.join('features', 'test_files', 'bad_file.rb'))
  click_button "Upload"
end





#SIDS STEPS


When(/^I select  "([^"]*)" from "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^P I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end
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



Then(/^I should not see that team$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" or "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^P I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^PENDING: I check "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

