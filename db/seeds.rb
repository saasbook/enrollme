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



discussions = [{:number => 1, :time => "Mon, 8-9am", :capacity => 30},
              {:number => 2, :time => "Mon, 9-10am", :capacity => 30},
              {:number => 3, :time => "Mon, 10-11am", :capacity => 30},
              {:number => 4, :time => "Mon, 11-12pm", :capacity => 30},
              {:number => 5, :time => "Mon, 12-1pm", :capacity => 30},
              {:number => 6, :time => "Mon, 1-2pm", :capacity => 30},
              {:number => 7, :time => "Mon, 2-3pm", :capacity => 30},
              {:number => 8, :time => "Mon, 3-4pm", :capacity => 30},
              {:number => 9, :time => "Mon, 4-5pm", :capacity => 30},
              {:number => 10, :time => "Mon, 5-6pm", :capacity => 30},
              {:number => 11, :time => "Tue, 8-9am", :capacity => 30},
              {:number => 12, :time => "Tue, 9-10am", :capacity => 30},
              {:number => 13, :time => "Tue, 10-11am", :capacity => 30},
              {:number => 14, :time => "Tue, 11-12pm", :capacity => 30},
              {:number => 15, :time => "Tue, 12-1pm", :capacity => 30},
              {:number => 16, :time => "Tue, 1-2pm", :capacity => 30},
              {:number => 17, :time => "Tue, 2-3pm", :capacity => 30},
              {:number => 18, :time => "Tue, 3-4pm", :capacity => 30},
              {:number => 19, :time => "Tue, 4-5pm", :capacity => 30},
              {:number => 20, :time => "Tue, 5-6pm", :capacity => 30},
              {:number => 21, :time => "Wed, 8-9am", :capacity => 30},
              {:number => 22, :time => "Wed, 9-10am", :capacity => 30},
              {:number => 23, :time => "Wed, 10-11am", :capacity => 30},
              {:number => 24, :time => "Wed, 11-12pm", :capacity => 30},
              {:number => 25, :time => "Wed, 12-1pm", :capacity => 30},
              {:number => 26, :time => "Wed, 1-2pm", :capacity => 30},
              {:number => 27, :time => "Wed, 2-3pm", :capacity => 30},
              {:number => 28, :time => "Wed, 3-4pm", :capacity => 30},
              {:number => 29, :time => "Wed, 4-5pm", :capacity => 30},
              {:number => 30, :time => "Wed, 5-6pm", :capacity => 30},
              {:number => 31, :time => "Thur, 8-9am", :capacity => 30},
              {:number => 32, :time => "Thur, 9-10am", :capacity => 30},
              {:number => 33, :time => "Thur, 10-11am", :capacity => 30},
              {:number => 34, :time => "Thur, 11-12pm", :capacity => 30},
              {:number => 35, :time => "Thur, 12-1pm", :capacity => 30},
              {:number => 36, :time => "Thur, 1-2pm", :capacity => 30},
              {:number => 37, :time => "Thur, 2-3pm", :capacity => 30},
              {:number => 38, :time => "Thur, 3-4pm", :capacity => 30},
              {:number => 39, :time => "Thur, 4-5pm", :capacity => 30},
              {:number => 40, :time => "Thur, 5-6pm", :capacity => 30},
              {:number => 41, :time => "Fri, 8-9am", :capacity => 30},
              {:number => 42, :time => "Fri, 9-10am", :capacity => 30},
              {:number => 43, :time => "Fri, 10-11am", :capacity => 30},
              {:number => 44, :time => "Fri, 11-12pm", :capacity => 30},
              {:number => 45, :time => "Fri, 12-1pm", :capacity => 30},
              {:number => 46, :time => "Fri, 1-2pm", :capacity => 30},
              {:number => 47, :time => "Fri, 2-3pm", :capacity => 30},
              {:number => 48, :time => "Fri, 3-4pm", :capacity => 30},
              {:number => 49, :time => "Fri, 4-5pm", :capacity => 30},
              {:number => 50, :time => "Fri, 5-6pm", :capacity => 30},
              ]
              
discussions.each do |discussion|
  Discussion.create!(discussion)
end

full = Discussion.create!(:number => 666, :time=> "Wed, 3pm", :capacity => 3)
somewhat_full = Discussion.create!(:number => 420, :time=> "Thu, 3pm", :capacity => 5)
Discussion.create!(:number => 1337, :time=> "Fri, 3pm", :capacity => 5)
Discussion.create!(:number => 1338, :time=> "Sat, 3pm", :capacity => 5)
Discussion.create!(:number => 1339, :time=> "Sun, 3pm", :capacity => 5)


full.teams << two

somewhat_full.teams << tone
