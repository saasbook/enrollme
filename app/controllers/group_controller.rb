class GroupController < ApplicationController
    
    def index
        status = params[:status]
        @status = status
        @teams_li = Team.filter_by(status)
        
        teams = []
        @teams_li.each do |t|
            if Group.has_team?(t.id, t.discussion_id)
                teams.push(t)
            end
        end
        teams.each do |t|
            @teams_li.delete(t)
        end
        render 'index'
    end
    
    def select_group
        status = params[:status]
        @status = status
        @teams_li = Team.filter_by(status)
        teams = []
        @teams_li.each do |t|
            if Group.has_team?(t.id, t.discussion_id)
                teams.push(t)
            end
        end
        teams.each do |t|
            @teams_li.delete(t)
        end
    
        render 'create'
    end
    
    def merge
        puts "hello"
        puts "________________"
        teams = []
        dis = ""
        for i in params
            if i[1] == {"selected"=>"1"}
                team_int = i[0].to_i
                team = Team.where({:id => team_int})
                team.each do |t|
                    teams.push(t.id)
                    puts t
                    dis = t.discussion_id
                end
            end
        end
        Group.create({:team1_id => teams[0], :team2_id => teams[1], :discussion_id => dis})
        puts Group.all.inspect
        redirect_to admin_select_group_path
    end
    
    
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


