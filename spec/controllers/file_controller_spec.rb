require 'rails_helper'

RSpec.describe FileController, type: :controller do
    render_views
    describe "GET #download_approved_teams" do
        before do
            @disc = Discussion.create!(:number => 1337, :time=> "Wed, 3pm", :capacity => 5)
            people = [
              { :name => "John"                   ,:major => "English"  , :sid => "111"  ,:email => "111@berkeley.edu"},
              { :name =>  "Josh"                   ,:major => "CS"  ,:sid => "222"  ,:email => "222@berkeley.edu"},
              { :name =>  "Jorge"                   ,:major => "English"  ,:sid => "333"  ,:email => "333@berkeley.edu"},
              { :name =>  "CCC"                   ,:major => "EECS"  ,:sid => "444"  ,:email => "444@berkeley.edu"},
              { :name =>  "DDD"                   ,:major => "English"  ,:sid => "555"  ,:email => "555@berkeley.edu"},
              { :name =>  "EEE"                   , :major =>"English"  ,:sid => "666"  ,:email => "666@berkeley.edu"},
              { :name => "FFF"                   ,:major => "EECS"  ,:sid => "777" ,:email => "777@berkeley.edu"},
              { :name => "GGG"                   ,:major => "CS"  ,:sid => "888" ,:email => "888@berkeley.edu"},
              { :name =>  "HHH"                   ,:major => "English"  ,:sid => "999" ,:email =>"999@berkeley.edu"},
              { :name =>  "III"                   ,:major => "English"  ,:sid => "1111" ,:email => "1111@berkeley.edu"},
              { :name =>  "JJJ"                   ,:major => "English"  ,:sid => "2222" ,:email => "2222@berkeley.edu"},
              { :name =>  "Kay"                   ,:major => "EECS"  ,:sid => "3333" ,:email => "3333@berkeley.edu"},
              { :name =>  "Ana"                   ,:major => "CS"  ,:sid => "4444" ,:email => "4444@berkeley.edu"},
              { :name =>  "Chris"                   ,:major => "CS"  ,:sid => "44444" ,:email => "44444@berkeley.edu"}
            ]
            
            people.each do |ue|
                User.create!(ue)
            end
            
            Admin.create!({:name => "admin", :email => "admin@admin.com"})
        
            @tone = Team.new
            @tone.submitted = true
            @tone.approve_with_discussion(@disc.id)
            @tone.passcode = "passcode1"
            @disc.teams << @tone
            @tone.save!
            @tone.users << User.where(name: "Josh")
            @tone.users << User.where(name: "CCC")
            @tone.users << User.where(name: "GGG")
            @tone.users << User.where(name: "FFF")
            @tone.users << User.where(name: "EEE")
            
            
            @ttwo = Team.new
            @ttwo.approved = false
            @ttwo.submitted = true
            @ttwo.passcode = "passcode2"
            @ttwo.save!
            @ttwo.users << User.where(name: "JJJ")
            @ttwo.users << User.where(name: "DDD")
            @ttwo.users << User.where(name: "III")
            @ttwo.users << User.where(name: "Kay")
            @ttwo.users << User.where(name: "Ana")
            
            @three = Team.new
            @three.submitted = false
            @three.approved = false
            @three.passcode = "passcode3"
            @three.users << User.where(name: "Chris")
            
            session[:user_id] = 1
            session[:is_admin] = true
            
            
            get :download_approved_teams
        end
    
        it "shows all approved teams" do
            expect(response.body).to include("Josh")
            expect(response.body).to include("GGG")
            expect(response.body).to include("EEE")
        end
        
        it "does not show submitted teams" do
            expect(response.body).not_to include("JJJ")
            expect(response.body).not_to include("III")
            expect(response.body).not_to include("Ana")
        end
        
        it "does not show invalid teams" do
            expect(response.body).not_to include("Chris")
        end
    end
end

