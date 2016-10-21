# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
people = [
  		[ "John"                   , "English"  , "111"  , "111@berkeley.edu", "132619"        ],
  		[ "Josh"                   , "CS"  , "222"  , "222@berkeley.edu"         ],
  		[ "Jorge"                   , "English"  ,"333"  , "333@berkeley.edu", "057663"         ],
  		[ "CCC"                   , "EECS"  , "444"  , "444@berkeley.edu", "012343"         ],
 	  	[ "DDD"                   , "English"  , "555"  , "555@berkeley.edu","144083"         ],
 	  	[ "EEE"                   , "English"  , "666"  , "666@berkeley.edu" ,  "920114"        ],
 	  	[ "FFF"                   , "EECS"  , "777" , "777@berkeley.edu", "783986"         ],
 	  	[ "GGG"                   , "CS"  , "888" , "888@berkeley.edu", "564742"         ],
 	  	[ "HHH"                   , "English"  , "999" , "999@berkeley.edu" , "634846"        ],
 	  	[ "III"                   , "English"  , "1111" , "1111@berkeley.edu"     ,"663607"    ],
 	  	[ "JJJ"                   , "English"  , "2222" , "2222@berkeley.edu", "464123"         ],
 	  	[ "Kay"                   , "EECS"  , "3333" , "3333@berkeley.edu","370603"         ],
 	  	[ "Ana"                   , "CS"  , "4444" , "4444@berkeley.edu" , "758603"        ]
    ]
    
people.each do |name, major, sid, email, password|
  User.create( name: name, major: major, sid: sid, email: email, password: password )
end

tone = Team.new
tone.approve = true
tone.passcode = "passcode1"
tone.save!
tone.users << User.where(name: "Christian Grey")
tone.users << User.where(name: "Ana Steele")
tone.users << User.where(name: "Sahai")


two = Team.new
two.approve = false
two.passcode = "passcode2"
two.save!
two.users << User.where(name: "Sonny Dykes")
two.users << User.where(name: "John")
two.users << User.where(name: "oski")


#Client.find_by! first_name: 'does not exist'