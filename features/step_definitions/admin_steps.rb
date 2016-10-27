Given /^the following admins exist$/ do |table|
  table.rows.each do |name, email, password|
    next if name == "name" # skipping table header
    Admin.create!(:name => name, :email => email, :password => password)
  end
end