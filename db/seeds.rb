# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admins = [
      { :name => "EnrollMe", :email => "enrollmeberkeley@gmail.com", :superadmin => false},
      { :name => "Michael-David Sasson", :email => "sasson@berkeley.edu", :superadmin => true},
      { :name => "Tony Lee", :email => "tony.lee@berkeley.edu", :superadmin => false}
  ]
  
admins.each do |a|
  Admin.create!(a)
end