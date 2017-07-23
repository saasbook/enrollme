# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admins = [
      { :name => "EnrollMe", :email => "enrollmeberkeley@gmail.com", :superadmin => true},
      { :name => "Michael-David Sasson", :email => "sasson@berkeley.edu", :superadmin => false}
  ]
  
Admin.delete_all
admins.each do |a|
  Admin.create!(a)
end

# users = [
#   {:name => "user1", :email=>"user1@berkeley.com", :team_id => "10" , :major=> "DECLARED CS/EECS Major", :sid=>001, :waitlisted=> "Yes"},
#   {:name => "user2", :email=>"user2@berkeley.com", :team_id => "10" , :major=> "DECLARED CS/EECS Major", :sid=>002, :waitlisted=> "Yes"},
#   {:name => "user3", :email=>"user3@berkeley.com", :team_id => "10" , :major=> "DECLARED CS/EECS Major", :sid=>003, :waitlisted=> "Yes"},
#   {:name => "user4", :email=>"user4@berkeley.com", :team_id => "10" , :major=> "DECLARED CS/EECS Major", :sid=>004, :waitlisted=> "Yes"},
#   {:name => "user5", :email=>"user5@berkeley.com", :team_id => "10" , :major=> "DECLARED CS/EECS Major", :sid=>005, :waitlisted=> "Yes"},
#   {:name => "user7", :email=>"user7@berkeley.com", :team_id => "10" , :major=> "DECLARED CS/EECS Major", :sid=>007, :waitlisted=> "Yes"}
#   ]
  
users.each do |user|
  User.create!(user)
end

Option.delete_all
Option.create!(
  :minimum_team_size => 3,
  :maximum_team_size => 3
  )

  
