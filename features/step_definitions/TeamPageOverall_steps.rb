Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    new_user = User.new(:name => user[:name], :major => user[:major], :sid => user[:sid], :email => user[:email])
    new_user.save
  end
end


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