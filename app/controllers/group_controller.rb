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
    
    
    # def random
    #     for Discussion.all.each do |discussion|
    #         teams = Teams.where(discussion_id: discussion.number)
    #         two_teams = []
    #         for teams.each do |team|
    #             if two_teams.length == 2
    #                 Group.create!(two_teams[0], two_teams[1])
    #             end
    #             if !Group.has_team?(team, discussion.number)
    #                 two_teams.push(team)
    #             end
    #         end
    #     end
    # end
    
end


