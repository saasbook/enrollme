Given /^"(.*)" requests to join my team$/ do |user|
end

Given /^the request from "([^"]*)" was "([^"]*)"$/ do |user, status|
end

Given /^I press the "([^"]*)" button on the same row as "([^"]*)"$/ do |req, name|
    page.find('tr', :text => name).click_link(req)
end

