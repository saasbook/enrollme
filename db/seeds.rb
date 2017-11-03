# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def createObjs(model, objs)
  model.delete_all
  objs.each {|obj| model.create! obj}
end

admins = [
      { :name => "EnrollMe", :email => "enrollmeberkeley@gmail.com", :superadmin => true},
      { :name => "Michael-David Sasson", :email => "sasson@berkeley.edu", :superadmin => false},
      { :name => "Test Admin", :email => "enrollme.test@gmail.com", :superadmin => false}
  ]

createObjs(Admin, admins)

Option.delete_all
Option.create!(
  :minimum_team_size => 3,
  :maximum_team_size => 3
  )

users = [
  {:name => "Bob Smith", :email => "bob@smith.com", :sid => "12345678", :major => "CS"}
]
createObjs(User, users)

teams = [
  {:approved => true, :passcode => "somePasscode"}
]

createObjs(Team, teams)

Team.all.each do |t|
  user = User.where(:email => "bob@smith.com")[0]
  t.users.append(user)
  t.save!
  user.team = t
  user.save!
end
