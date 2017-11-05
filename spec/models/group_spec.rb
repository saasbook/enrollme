require 'rails_helper'

RSpec.describe Group, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "Checking if a team is in a group" do
          before do
      @full = Discussion.new(:number => 666, :time=> "Wed, 3pm", :capacity => 5)
      @empty = Discussion.new(:number => 1337, :time=> "Wed, 3pm", :capacity => 5)
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
 	  	{:name =>  "Chris"                   ,:major => "CS"  ,:sid => "44444" ,:email => "44444@berkeley.edu"}
    ]
        
    people.each do |ue|
        User.create!( ue)
    end
    
    
    @tone = Team.new
    @tone.approved = true
    @tone.submitted = true
    @tone.passcode = "passcode1"
    @tone.save!
    @tone.users << User.where(name: "Josh")
    @tone.users << User.where(name: "CCC")
    @tone.users << User.where(name: "GGG")
    @tone.users << User.where(name: "FFF")
    @tone.users << User.where(name: "EEE")
    
    
    @ttwo = Team.new
    @ttwo.approved = true
    @ttwo.submitted = true
    @ttwo.passcode = "passcode2"
    @ttwo.save!
    @ttwo.users << User.where(name: "JJJ")
    @ttwo.users << User.where(name: "DDD")
    @ttwo.users << User.where(name: "III")
    @ttwo.users << User.where(name: "Kay")
    
    @group = Group.new
    @group.team1_id = @tone.id
    @group.team2_id = @ttwo.id
    @group.discussion_id = @empty.number
    @group.save!
    
    end
      it "returns true if a team has a group and false otherwise" do
          expect(Group.has_team?(@tone.id, @empty.number) == true)
          expect(Group.has_team?(@tone.id, @full.number) == false)
      end
      
      it "unmerge a well defined group" do 
          Group.unmerge(@group.id)
          expect(Group.all == nil)
      end
  end
end
