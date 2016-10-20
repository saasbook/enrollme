# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
people = [
  		[ "John"                   , "Gender Studies"  , "666"  , "papajohn@berkeley.edu", "132619"        ],
  		[ "Josh"                   , "CS"  , "420"  , "legueoflegends666@berkeley.edu"         ],
  		[ "Jorge"                   , "Football Player"  ,"999"  , "legueoflegends667@berkeley.edu", "057663"         ],
  		[ "Sahai"                   , "EECS"  , "4"  , "eecs666@berkeley.edu", "012343"         ],
 	  	[ "oski"                   , "mmmm"  , "69"  , "drugz@berkeley.edu","144083"         ],
 	  	[ "Sonny Dykes"                   , "Useless"  , "1"  , "football@berkeley.edu" ,  "920114"        ],
 	  	[ "Christos"                   , "EECS"  , "23423" , "papad@berkeley.edu", "783986"         ],
 	  	[ "Luca"                   , "CS"  , "11111" , "luca@berkeley.edu", "564742"         ],
 	  	[ "Putin"                   , "badass"  , "696969" , "wolfsmilk@berkeley.edu" , "634846"        ],
 	  	[ "Trump"                   , "chetoe"  , "420420" , "wtf@berkeley.edu"     ,"663607"    ],
 	  	[ "Killary"                   , "President"  , "111111" , "ewwpeasants@berkeley.edu", "464123"         ],
 	  	[ "Christian Grey"                   , "EECS"  , "123123" , "mmmmmm@berkeley.edu","370603"         ],
 	  	[ "Ana Steele"                   , "CS"  , "33333" , "more_mmmmm@berkeley.edu" , "758603"        ]
    ]
    
people.each do |name, major, sid, email, password|
  User.create( name: name, major: major, sid: sid, email: email, password: password )
end

tone = Team.new
tone.approve = true
tone.comment = "all eecs eecs eecs "
tone << User.where(name: "Christian Grey")
tone << User.where(name: "Ana Steele")
tone << User.where(name: "Sahai")
tone.save!

two = Team.new
two.approve = false
two.comment = "humanties majors are here so not approved "
two << User.where(name: "Sonny Dykes")
two << User.where(name: "John")
two << User.where(name: "oski")
two.save!

#Client.find_by! first_name: 'does not exist'