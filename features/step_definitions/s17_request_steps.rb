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

Given /^there is a request from "(.*)" to the team with "(.*)"$/ do |source, target|
  target_team = User.find_by(name: target).team
  source_team = User.find_by(name: source).team
  req = Request.create(source_id: source_team.id, target_id: target_team.id)
end