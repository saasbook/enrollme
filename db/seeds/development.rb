# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admins = [
    { :name => "EnrollMe", :email => "enrollmeberkeley@gmail.com", :superadmin => true},
    { :name => "Michael-David Sasson", :email => "sasson@berkeley.edu", :superadmin => false},
    { :name => "George Su", :email => "georgesu1074@berkeley.edu", :superadmin => false},
    { :name => "Derek Hsiao", :email => "hsiaoderek@berkeley.edu", :superadmin => false}
]

Admin.delete_all
admins.each do |a|
  Admin.create!(a)
end


Option.delete_all
Option.create!(
    :minimum_team_size => 3,
    :maximum_team_size => 3
)

# Below is all of my Test Seeds - George

User.delete_all
Team.delete_all

users = [
    {:name => "Derek Hsiao", :email => "hsiaoderek@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 111, :team_id => nil},
    {:name => "Enrollme Tester", :email => "enrollmetester@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 222, :team_id => 1},
    {:name => "Hadi Zhang", :email => "hz@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 333, :team_id => 2},
    {:name => "Ken Chiu", :email => "kc@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 444, :team_id => 3},
    {:name => "Oski Bear", :email => "oski@gmail.com", :major => 'Other Major', :waitlisted => true, :sid => 555, :team_id => 3}
  ]

users.each do |user|
  User.create!(user)
end

team1 = Team.create!(:passcode => Team.generate_hash, :approved => false, :submitted => false) #id = 1
team2 = Team.create!(:passcode => Team.generate_hash, :approved => false, :submitted => false) #id = 2
team3 = Team.create!(:passcode => Team.generate_hash, :approved => false, :submitted => false) #id = 3

# requests = [
#
# ]

# counter = 2
#
# users.each do |u|
#   current_user = User.create!(u)
#   if counter < 2
#     team1.users << current_user
#     current_user.team = team1
#     counter += 1
#   elsif counter < 5
#     team2.users << current_user
#     current_user.team = team2
#     counter += 1
#   elsif counter < 9
#     team3.users << current_user
#     current_user.team = team3
#     counter += 1
#   end
# end
