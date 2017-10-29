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
      { :name => "Yonas Kbrom", :email => "kbromyonas@berkeley.edu", :superadmin => true},
      { :name => "Monty Inaya", :email => "mr.monty@berkeley.edu", :superadmin => true},
      { :name => "Vikram Baid", :email => "vbaid@berkeley.edu", :superadmin => true},
      { :name => "Mark Sun", :email => "msun908@berkeley.edu", :superadmin => true},
      { :name => "Timothy Stepro", :email => "stepro.015389@berkeley.edu", :superadmin => true},
      { :name => "Minjoo Sur", :email => "minjoo@berkeley.edu", :superadmin => true},
    
  ]
  
users = [ 
      { :name => "Yonas Kbrom", :email => "kbromyonas@gmail.com", :major => "CS", :sid => 111111, :team_id => 1},
      { :name => "Monty Inaya", :email => "mr.monty@gmail.com", :major => "CS", :sid => 222222, :team_id => 1},
      { :name => "Vikram Baid", :email => "vbaid@gmail.com", :major => "CS", :sid => 333333, :team_id => 1},
      
      { :name => "Mark Sun", :email => "msun908@gmail.com", :major => "CS", :sid => 444444, :team_id => 2},
      { :name => "Timothy Stepro", :email => "stepro.015389@gmail.com", :major => "CS", :sid => 555555, :team_id => 2},
      { :name => "Minjoo Sur", :email => "minjoo@gmail.com", :major => "CS", :sid => 6666666, :team_id => 2},
      
      { :name => "Lonzo Ball", :email => "ball@gmail.com", :major => "CS", :sid => 777777, :team_id => 3},
      { :name => "Kobe Bryant", :email => "bryant@gmail.com", :major => "CS", :sid => 888888, :team_id => 3},
      { :name => "Pau Gasol", :email => "gasol@gmail.com", :major => "CS", :sid => 999999, :team_id => 3},
      
      { :name => "Yonas Kbrom", :email => "kbromyonas1@gmail.com", :major => "CS", :sid => 111112},
      { :name => "Paul Pierce", :email => "pierce@gmail.com", :major => "CS", :sid => 133113, :team_id => 4},
      { :name => "Kevin Garnett", :email => "garnett@gmail.com", :major => "CS", :sid => 144114, :team_id => 4},
  ]
  
teams = [
      { :approved => false, :passcode => "abc", :submission_id => 1, :submitted => true},
      { :approved => false, :passcode => "def", :submission_id => 2, :submitted => true},
      { :approved => false, :passcode => "ghi", :submission_id => 3, :submitted => true},
      { :approved => false, :passcode => "wack", :submitted => false},
  ]
  
discussions = [
      { :number => 12121, :time => "8-9am", :capacity => 24, :day => "M"},
      { :number => 21212, :time => "8-9am", :capacity => 24, :day => "W"},
      { :number => 34343, :time => "8-9am", :capacity => 24, :day => "F"},
    
  ]
  
submissions = [
      { :disc1id => 1, :disc2id => 2, :disc3id => 3, :team_id => 1},
      { :disc1id => 2, :disc2id => 3, :disc3id => 1, :team_id => 2},
      { :disc1id => 3, :disc2id => 2, :disc3id => 1, :team_id => 3},
  
  ]
  
# User.delete_all
# users.each do |t|
#   User.create!(t)
# end  

# Team.delete_all
# teams.each do |t|
#   Team.create!(t)
# end

# Discussion.delete_all
# discussions.each do |a|
#   Discussion.create!(a)
# end

# Submission.delete_all
# submissions.each do |a|
#   Submission.create!(a)
# end
  
Admin.delete_all
admins.each do |a|
  Admin.create!(a)
end

Option.delete_all
Option.create!(
  :minimum_team_size => 3,
  :maximum_team_size => 3
  )
puts Group.all.inspect
puts "———"
puts User.all.inspect
puts "———"
puts Discussion.all.inspect
puts "———"
puts Team.all.inspect
puts "———"
puts Submission.all.inspect