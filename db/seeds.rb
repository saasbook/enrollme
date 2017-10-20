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
      { :name => "Yonas Kbrom", :email => "kbromyonas@berkeley.edu", :superadmin => false},
      { :name => "Monty Inaya", :email => "mr.monty@berkeley.edu", :superadmin => false},
      { :name => "Vikram Baid", :email => "vbaid@berkeley.edu", :superadmin => false},
      { :name => "Mark Sun", :email => "msun908@berkeley.edu", :superadmin => false},
      { :name => "Timothy Stepro", :email => "stepro.015389@berkeley.edu", :superadmin => false},
      { :name => "Minjoo Sur", :email => "minjoo@berkeley.edu", :superadmin => false},
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

  
