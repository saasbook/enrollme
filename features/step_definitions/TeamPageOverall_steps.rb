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
  table.rows.each do |name, email, password, team, major, sid|
    next if name == "name" # skipping table header
    team == nil if team == "0"
    if team != "0"
      User.create!(:team => Team.new(:approved => false, :passcode => name+team), :major => major, :name => name, :email => email, :sid => sid, :password => password)
    else
      User.create!(:team => nil, :major => major, :name => name, :email => email, :sid => sid, :password => password)
    end
  end
end

And /^a team exists$/ do
  Team.create!(:approved => false, :passcode => "idc")
end