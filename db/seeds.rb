# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
people = [
  		{ :name => "John"                   ,:major => "English"  , :sid => "111"  ,:email => "111@berkeley.edu",:password => "132619"        },
  		{ :name =>  "Josh"                   ,:major => "CS"  ,:sid => "222"  ,:email => "222@berkeley.edu", :password => "666666"         },
  		{ :name =>  "Jorge"                   ,:major => "English"  ,:sid => "333"  ,:email => "333@berkeley.edu",:password => "057663"         },
  		{ :name =>  "CCC"                   ,:major => "EECS"  ,:sid => "444"  ,:email => "444@berkeley.edu",:password => "012343"         },
 	  	{ :name =>  "DDD"                   ,:major => "English"  ,:sid => "555"  ,:email => "555@berkeley.edu",:password =>"144083"         },
 	  	{:name =>  "EEE"                   , :major =>"English"  ,:sid => "666"  ,:email => "666@berkeley.edu" ,:password =>  "920114"        },
 	  	{:name => "FFF"                   ,:major => "EECS"  ,:sid => "777" ,:email => "777@berkeley.edu",:password => "783986"         },
 	  	{:name => "GGG"                   ,:major => "CS"  ,:sid => "888" ,:email => "888@berkeley.edu",:password => "564742"         },
 	  	{:name =>  "HHH"                   ,:major => "English"  ,:sid => "999" ,:email =>"999@berkeley.edu" ,:password => "634846"        },
 	  	{:name =>  "III"                   ,:major => "English"  ,:sid => "1111" ,:email => "1111@berkeley.edu"     ,:password => "663607"    },
 	  	{:name =>  "JJJ"                   ,:major => "English"  ,:sid => "2222" ,:email => "2222@berkeley.edu",:password => "464123"         },
 	  	{:name =>  "Kay"                   ,:major => "EECS"  ,:sid => "3333" ,:email => "3333@berkeley.edu",:password => "370603"         },
 	  	{:name =>  "Ana"                   ,:major => "CS"  ,:sid => "4444" ,:email => "4444@berkeley.edu" ,:password =>"758603"        }
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
tone.users << User.where(name: "EEE")




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
  		{ :name => "Anna", :email => "sid.masih@berkeley.edu",:password => "appleaimer" },
  		{ :name => "Bruce", :email => "dkoh@berkeley.edu",:password => "bananabruiser" },
  		{ :name => "EnrollMe", :email => "enrollmeberkeley@gmail.com", :password => "eecseecseecs" }
  ]
  
admins.each do |a|
  Admin.create!(a)
end


full = Discussion.create!(:number => 666, :day=> "Wednesday", :time=> "3pm", :capacity => 3)
somewhat_full = Discussion.create!(:number => 420, :day=> "Thursday", :time=> "3pm", :capacity => 5)
Discussion.create!(:number => 1337, :day=>"Wednesday", :time=> "3pm", :capacity => 5)
Discussion.create!(:number => 1338, :day=>"Thusday", :time=> "3pm", :capacity => 5)
Discussion.create!(:number => 1339, :day=>"Friday", :time=> "3pm", :capacity => 5)


full.teams << two

somewhat_full.teams << tone
