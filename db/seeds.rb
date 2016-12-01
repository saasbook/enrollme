# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
people = [
  		{ :name => "John"                   ,:major => "English"  , :sid => "111"  ,:email => "111@berkeley.edu"},
  		{ :name =>  "Josh"                   ,:major => "CS"  ,:sid => "222"  ,:email => "222@berkeley.edu"},
  		{ :name =>  "Jorge"                   ,:major => "English"  ,:sid => "333"  ,:email => "333@berkeley.edu"},
  		{ :name =>  "CCC"                   ,:major => "EECS"  ,:sid => "444"  ,:email => "444@berkeley.edu"},
 	  	{ :name =>  "DDD"                   ,:major => "English"  ,:sid => "555"  ,:email => "555@berkeley.edu"},
 	  	{:name =>  "EEE"                   , :major =>"English"  ,:sid => "666"  ,:email => "666@berkeley.edu"},
 	  	{:name => "FFF"                   ,:major => "EECS"  ,:sid => "777" ,:email => "777@berkeley.edu"},
 	  	{:name => "GGG"                   ,:major => "CS"  ,:sid => "888" ,:email => "888@berkeley.edu"},
 	  	{:name =>  "HHH"                   ,:major => "English"  ,:sid => "999" ,:email =>"999@berkeley.edu"},
 	  	{:name =>  "III"                   ,:major => "English"  ,:sid => "1111" ,:email => "1111@berkeley.edu"},
 	  	{:name =>  "JJJ"                   ,:major => "English"  ,:sid => "2222" ,:email => "2222@berkeley.edu"},
 	  	{:name =>  "Kay"                   ,:major => "EECS"  ,:sid => "3333" ,:email => "3333@berkeley.edu"},
 	  	{:name =>  "Ana"                   ,:major => "CS"  ,:sid => "4444" ,:email => "4444@berkeley.edu"},
 	  	{:name =>  "Anant Sahai"                   ,:major => "EECS"  ,:sid => "26131973" ,:email => "sid.masih@gmail.com"},
 	  	{:name =>  "Adnan Hemani"                   ,:major => "CS"  ,:sid => "26726609" ,:email => "adnan.h@berkeley.edu"}
    ]

people.each do |ue|
  User.create!( ue)
end

tone = Team.new
tone.approved = false
tone.submitted = false
tone.passcode = "passcode1"
tone.save!
tone.users << User.where(name: "Josh")
tone.users << User.where(name: "CCC")
tone.users << User.where(name: "GGG")
tone.users << User.where(name: "Jorge")
tone.users << User.where(name: "Adnan")




two = Team.new
two.approved = false
two.submitted = false
two.passcode = "passcode2"
two.save!
two.users << User.where(name: "JJJ")
two.users << User.where(name: "DDD")
two.users << User.where(name: "John")

tthree = Team.new
tthree.approved = false
tthree.submitted = false
tthree.passcode = "passcode3"
tthree.save!
tthree.users << User.where(name: "Kay")
tthree.users << User.where(name: "Ana")
tthree.users << User.where(name: "III")


admins = [
  		{ :name => "Anna", :email => "sid.masih@berkeley.edu", :superadmin => false},
  		{ :name => "Bruce", :email => "dkoh@berkeley.edu", :superadmin => false},
  		{ :name => "EnrollMe", :email => "enrollmeberkeley@gmail.com", :superadmin => true},
  		{ :name => "Rihanna", :email => "v.mathuria@berkeley.edu", :superadmin => false}
  ]
  
admins.each do |a|
  Admin.create!(a)
end


full = Discussion.create!(:number => 66666, :day=> "Wednesday", :time=> "3pm", :capacity => 3)
somewhat_full = Discussion.create!(:number => 42000, :day=> "Thursday", :time=> "3pm", :capacity => 5)
spank = Discussion.create!(:number => 50400, :day=> "Friday", :time=> "2pm", :capacity => 20)
Discussion.create!(:number => 13370, :day=>"Wednesday", :time=> "3pm", :capacity => 5)
Discussion.create!(:number => 13380, :day=>"Thusday", :time=> "3pm", :capacity => 5)
Discussion.create!(:number => 13390, :day=>"Friday", :time=> "3pm", :capacity => 5)
Discussion.create!(:number => 54321, :day=>"Tuesday", :time=> "3:00 P.M.", :capacity => 25)


full.teams << two
somewhat_full.teams << tone
spank.teams << tthree