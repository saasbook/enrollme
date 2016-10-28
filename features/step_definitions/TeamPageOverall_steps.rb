# Given /the following users exist/ do |user_table|
#   user_table.hashes.each do |user|
#     # each returned element will be a hash whose key is the table header.
#     # you should arrange to add that movie to the database here.
#     new_user = User.new(:name => user[:name], :major => user[:major], :sid => user[:sid], :email => user[:email])
#     new_user.save
#   end
# end


# Given /^(.*) logs in/ do |user|
#     user.login #may need to change in the future! 
# end


# When(/^I count less than (\d+) members in (.*)$/) do |number, table_name|
#     #page.all('table#{table_name} tr').count.should < number
#     pending
# end

# When(/^I count more than (\d+) members in (.*)$/) do |number, table_name|
#     #page.all('table#{table_name} tr').count.should > number
#     pending
# end

When /^PENDING: ^(the following users exist)/ do |arg|
  pending
end
# Example usage:
    # Note: use "0" as team to indicate that this student isn't on a team yet
    # Given the following users exist
    #  | team | major           |   name    |       email                    | sid |
  	#  | 0    | Football Player | Jorge     |  legueoflegends667@hotmail.com | 999 |
 	#  | 1    | EECS            | Sahai     |  eecs666@hotmail.com			 | 000 |
Given /^the following users exist$/ do |table|
  table.rows.each do |name, email, password, team_passcode, major, sid|
    next if name == "name" # skipping table header
    if team_passcode != "0"
      @team = Team.create!(:approved => false, :passcode => team_passcode)
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