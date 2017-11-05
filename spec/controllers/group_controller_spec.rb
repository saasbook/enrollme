require 'rails_helper'

RSpec.describe GroupController, type: :controller do
    # render_views
    # describe "GET #download_approved_teams" do
    #     before do
    #         @disc = Discussion.create!(:number => 13397, :time=> "Wed, 3pm", :capacity => 5)
    #         people = [
    #           { :name => "John"                   ,:major => "English"  , :sid => "111"  ,:email => "111@berkeley.edu"},
    #           { :name =>  "Josh"                   ,:major => "CS"  ,:sid => "222"  ,:email => "222@berkeley.edu"},
    #           { :name =>  "Jorge"                   ,:major => "English"  ,:sid => "333"  ,:email => "333@berkeley.edu"},
    #           { :name =>  "CCC"                   ,:major => "EECS"  ,:sid => "444"  ,:email => "444@berkeley.edu"},
    #           { :name =>  "DDD"                   ,:major => "English"  ,:sid => "555"  ,:email => "555@berkeley.edu"},
    #           { :name =>  "EEE"                   , :major =>"English"  ,:sid => "666"  ,:email => "666@berkeley.edu"},
    #           { :name => "FFF"                   ,:major => "EECS"  ,:sid => "777" ,:email => "777@berkeley.edu"},
    #           { :name => "GGG"                   ,:major => "CS"  ,:sid => "888" ,:email => "888@berkeley.edu"},
    #           { :name =>  "HHH"                   ,:major => "English"  ,:sid => "999" ,:email =>"999@berkeley.edu"},
    #           { :name =>  "III"                   ,:major => "English"  ,:sid => "1111" ,:email => "1111@berkeley.edu"},
    #           { :name =>  "JJJ"                   ,:major => "English"  ,:sid => "2222" ,:email => "2222@berkeley.edu"},
    #           { :name =>  "Kay"                   ,:major => "EECS"  ,:sid => "3333" ,:email => "3333@berkeley.edu"},
    #           { :name =>  "Ana"                   ,:major => "CS"  ,:sid => "4444" ,:email => "4444@berkeley.edu"},
    #           { :name =>  "Chris"                   ,:major => "CS"  ,:sid => "44444" ,:email => "44444@berkeley.edu"}
    #         ]
    #         people.each do |ue|
    #             User.create!(ue)
    #         end
    #         Admin.create!({:name => "admin", :email => "admin@admin.com"})
    #         @team1 = Team.new
    #         @team1.submitted = true
    #         @team1.approve_with_discussion(@disc.id)
    #         @team1.passcode = "passcode1"
    #         @disc.teams << @team1
    #         @team1.save!
    #         @team1.users << User.where(name: "Josh")
    #         @team1.users << User.where(name: "CCC")
    #         @team1.users << User.where(name: "GGG")
    #         @team1.users << User.where(name: "FFF")
    #         @team1.users << User.where(name: "EEE")
            
            
    #         @team2 = Team.new
    #         @team2.approved = false
    #         @team2.submitted = true
    #         @team2.passcode = "passcode2"
    #         @team2.save!
    #         @team2.users << User.where(name: "JJJ")
    #         @team2.users << User.where(name: "DDD")
    #         @team2.users << User.where(name: "III")
    #         @team2.users << User.where(name: "Kay")
    #         @team2.users << User.where(name: "Ana")
            
    #         @team3 = Team.new
    #         @team3.submitted = false
    #         @team3.approved = false
    #         @team3.passcode = "passcode3"
    #         @team3.users << User.where(name: "Chris")
            
    #         session[:user_id] = 1
    #         session[:is_admin] = true
    #         params[:]
            
    #         get :download_approved_teams, :status => "Approved"
    #     end
    
    #     it "shows all approved teams" do
    #         expect(response.body).to include("Josh")
    #         expect(response.body).to include("GGG")
    #         expect(response.body).to include("EEE")
    #     end
        
    #     it "does not show submitted teams" do
    #         expect(response.body).not_to include("JJJ")
    #         expect(response.body).not_to include("III")
    #         expect(response.body).not_to include("Ana")
    #     end
        
    #     it "does not show invalid teams" do
    #         expect(response.body).not_to include("Chris")
    #     end
    # end
end
