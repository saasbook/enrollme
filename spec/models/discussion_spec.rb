require 'rails_helper'

RSpec.describe Discussion, type: :model do
  describe "#submit" do

    before do
      @full = Discussion.new(:number => 666, :time=> "Wed, 3pm", :capacity => 5, :seats_open => 5)
      @somewhat_full = Discussion.new(:number => 420, :time=> "Wed, 3pm", :capacity => 5, :seats_open => 5)
      @somewhat_full_closed = Discussion.new(:number => 420, :time=> "Wed, 3pm", :capacity => 5, :seats_open => 5)
      @empty = Discussion.new(:number => 1337, :time=> "Wed, 3pm", :capacity => 5, :seats_open => 5)
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
 	  	{:name =>  "Ana"                   ,:major => "CS"  ,:sid => "4444" ,:email => "4444@berkeley.edu" ,:password =>"758603"        },
 	  	{:name =>  "Chris"                   ,:major => "CS"  ,:sid => "44444" ,:email => "44444@berkeley.edu" ,:password =>"7586003"        }
    ]
        
    people.each do |ue|
        User.create!( ue)
    end
    
    
    @tone = Team.new
    @tone.approved = true
    @tone.passcode = "passcode1"
    @tone.save!
    @tone.users << User.where(name: "Josh")
    @tone.users << User.where(name: "CCC")
    @tone.users << User.where(name: "GGG")
    @tone.users << User.where(name: "FFF")
    @tone.users << User.where(name: "EEE")
    
    
    @ttwo = Team.new
    @ttwo.approved = false
    @ttwo.passcode = "passcode2"
    @ttwo.save!
    @ttwo.users << User.where(name: "JJJ")
    @ttwo.users << User.where(name: "DDD")
    @ttwo.users << User.where(name: "III")
    @ttwo.users << User.where(name: "Kay")
    
    
    @tofone = Team.new
    @tofone.approved = false
    @tofone.passcode = "passcode2"
    @tofone.save!
    @tofone.users << User.where(name: "HHH")
    
    @addthis = Team.new
    @addthis.approved = false
    @addthis.passcode = "passcode2"
    @addthis.save!
    @addthis.users << User.where(name: "Ana")
    @addthis.users << User.where(name: "John")
    @addthis.users << User.where(name: "Jorge")
    @addthis.users << User.where(name: "Chris")
    
    @full.teams << @tone
    @somewhat_full.teams << @tofone
    @somewhat_full_closed.teams << @ttwo
    
    
    
    end

    describe "Checking Discussions Work" do
      it "Full Discussion" do
        expect(@full.capacity == 10)
        expect(@full.seats_open == 0)
        expect(@full.eql? "Wed, 3pm")
        expect(@full.count_students == 3)
        
      end
      it { should respond_to(:teams) }
      
      it "Somewhat Full Discussion" do
        expect(@somewhat_full.capacity == 10)
        expect(@somewhat_full.seats_open == 3)
        expect(@somewhat_full.eql? "Wed, 3pm")
      end


     
      it "very full discussion" do
        expect(@somewhat_full_closed.capacity == 10)
        expect(@somewhat_full_closed.seats_open == 2)
        expect(@somewhat_full_closed.eql? "Wed, 3pm")
      end
    
     
      it "empty disc" do
        expect(@empty.capacity == 10)
        expect(@empty.seats_open == 10)
        expect(@empty.eql? "Wed, 3pm")
      end
    end
    
    describe "teams work" do 
       it "Check @tone" do
           expect(@tone).to be_an_instance_of(Team)
       end
       
       it "add team to somewhat somewhat_full disc" do
          expect(@somewhat_full.can_take_team(@addthis) == true)
          
       end
       
       it "add team to empty disc" do
          expect(@empty.can_take_team(@addthis) == true) 
       end
       
       it "add team to somewhat full but closed disc" do
          expect(@somewhat_full_closed.can_take_team(@addthis) == false) 
       end
       
        it "add team to full disc" do
          expect(@full.can_take_team(@addthis) == false) 
       end
       
       
    end
    
    

  end
end
