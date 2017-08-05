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
    { :name => "George Su", :email => "georgesu1074@gmail.com", :superadmin => false},
    { :name => "Derek Hsiao", :email => "hsiaoderek@berkeley.edu", :superadmin => false},
    { :name => "Karl Hayek", :email => "karlos9009@gmail.com", :superadmin => false}
]

Admin.delete_all
admins.each do |a|
  Admin.create!(a)
end


Option.delete_all
Option.create!(
  :minimum_team_size => 5,
  :maximum_team_size => 6
  )

# Below is all of my Test Seeds - George

User.delete_all
Team.delete_all

users = [
  {:name => "Brandon Jabr", :email => "gs@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 123456, :time_commitment=>20},
  {:name => "Hadi Zhang", :email => "hadizhang@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 1234567, :time_commitment=> 30},
  {:name => "Derek Hsiao", :email => "dh@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 123453, :time_commitment=> 40},
  {:name => "Ken Chiu", :email => "kc@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 123454, :time_commitment=> 50},
  {:name => "Hadi Two", :email => "ihad3000@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 153456, :time_commitment=>10},
  {:name => "Karl Hayek", :email => "kh@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 123756, :time_commitment=>15},
  {:name => "Carina Boo", :email => "cb@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 1238556, :time_commitment=>20},
  {:name => "Oski Bear", :email => "ob@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 123446, :time_commitment=>100},
  {:name => "Aladdin", :email => "aladdin@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => true, :sid => 19356, :time_commitment=>55},
  {:name => "Kalord", :email => "karlhayek97@gmail.com", :major => 'DECLARED CS/EECS Major', :waitlisted => false, :sid => 9344456, :time_commitment=>55}
  ]
  
  team1 = Team.new(:passcode => Team.generate_hash, :approved => false, :submitted => false)
  team2 = Team.new(:passcode => Team.generate_hash, :approved => false, :submitted => false)
  team3 = Team.new(:passcode => Team.generate_hash, :approved => false, :submitted => false)

requests = [
]

counter = 0

users.each do |u|
  current_user = User.create!(u)
  if counter < 3
    team1.users << current_user
    team1.update_waitlist
    current_user.team = team1
    counter += 1
  elsif counter < 5
    team2.users << current_user
    team2.update_waitlist
    current_user.team = team2
    counter += 1
  else 
    team3.users << current_user
    team3.update_waitlist
    current_user.team = team3
    counter += 1
  end
end
