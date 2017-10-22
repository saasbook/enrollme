class GroupController < ApplicationController
    
    def index
        status = params[:status]
        @status = status
        @teams_li = Team.filter_by(status)
        render 'index'
    end
    
    
    # def show
    #     status = params[:status]
    #     @status = status
    #     @teams_li = Team.filter_by(status)
    #     render 'index'
    # end
    
    def select_group
     status = params[:status]
     @status = status
     @teams_li = Team.filter_by(status)
     render 'create'
    end
    
    
    # def random
    #     for Discussion.all.each do |discussion|
    #         teams = Teams.where(discussion_id : discussion.number)
    #         two_teams = []
    #         for teams.each do |team|
    #             if two_teams.length == 2
    #                 Group.create!(two_teams[0], two_teams[1])
    #             end
    #             if !Group.has_team?(team)
    #                 two_teams.push(team)
    #             end
    #         end
    #     end
    # end
end


