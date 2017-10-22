class GroupController < ApplicationController
    
    def index
        @groups_li = Group.all
        render 'index'
    end
    
    
    def show
        @groups_li = Group.all
        render 'index'
    end
    
    def select_group
     status = params[:status]
     @status = status
     @teams_li = Team.filter_by(status)
     render 'create'
    end
    
    #Method that randomly pairs teams in the same discussion 
    def random
        Discussion.all.each do |discussion|
            teams = Team.where(:discussion_id => discussion.id)
            
            #This list holds two unpaired teams
            two_teams = []
            teams.each do |team|
                if Group.has_team?(team.id, discussion.id) == false
                    two_teams.push(team.id)
                end
                if two_teams.length == 2
                    Group.create!({:team1_id => two_teams[0], :team2_id => two_teams[1], :discussion_id => discussion.id})
                    two_teams = []
                end
            end
        end
        redirect_to admins_path
    end
end


