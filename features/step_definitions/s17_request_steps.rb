# Given /^"(.*)" requests to join my team$/ do |user|
# end

Given /^the request from "([^"]*)" was "([^"]*)"$/ do |user, status|
  user = User.find_by(name: user)
  req = Request.find_by(source_id: user.team_id)
  if status == "accepted"
    req.join
  end
  req.destroy
end

Then /^save (?:me )?(?:the )?page$/ do
  puts page.html
end