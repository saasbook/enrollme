# Given /^"(.*)" requests to join my team$/ do |user|
# end

Given /^the request from "([^"]*)" was "([^"]*)"$/ do |user, status|
  user = User.find_by_name(user)
  req = Request.find_by_user_id(user.id)
  if status == "accepted"
    req.join
  end
  req.destroy
end