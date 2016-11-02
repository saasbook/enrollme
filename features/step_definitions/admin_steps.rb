Given /^the following admins exist$/ do |table|
  table.rows.each do |name, email, password|
    next if name == "name" # skipping table header
    Admin.create!(:name => name, :email => email, :password => password)
  end
end

Then /^I should have downloaded a team information file$/ do
   page.response_headers['Content-Disposition'].should include("team_info.txt")
end

When /^I upload a discussion file$/ do
  attach_file(:discussions, File.join('features', 'test_files', 'discussion_info.txt'))
  click_button "Upload"
end
 
When /^I upload an invalid file$/ do
  attach_file(:discussions, File.join('features', 'test_files', 'bad_file.rb'))
  click_button "Upload"
end