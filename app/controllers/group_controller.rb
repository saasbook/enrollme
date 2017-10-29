class GroupController < ApplicationController
    
    def index
        # status = params[:status]
        # @status = status
        # @teams_li = Team.filter_by(status)
        
        # teams = []
        # @teams_li.each do |t|
        #     if Group.has_team?(t.id, t.discussion_id)
        #         teams.push(t)
        #     end
        # end
        # teams.each do |t|
        #     @teams_li.delete(t)
        # end
        @groups_li = Group.all
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
        teams = []
        discussions = Set.new
        for i in params
            if i[1] == {"selected"=>"1"}
                team = Team.where({:id => i[0].to_i})
                team.each do |t|
                    teams.push(t.id)
                    discussions.add(t.discussion_id)
                    @dis = t.discussion_id
                end
            end
        end
        if discussions.size == 1 and teams.length == 2 
            Group.create({:team1_id => teams[0], :team2_id => teams[1], :discussion_id => @dis})
            flash[:success] = "Group Created!"
        elsif discussions.size != 1
            flash[:error] = "Select teams with same discussions!"
        elsif teams.length != 2 
            flash[:error] = "Must select two teams!"
        end
        
        # puts Group.all.inspect
        redirect_to admin_select_group_path
    end
    
    def unmerge
        count = 0
        for i in params
            if i[1] == {"group"=>"1"}
                groups = Group.where({:id => i[0].to_i})
                groups.each do |g|
                    @group_id = g.id
                    count+=1
                end
            end
            # puts i
            # puts "---"
        end
        if count == 1
            Group.unmerge(@group_id)
            flash[:success] = "Group Destroyed!"
        else
            flash[:success] = "Select one group!"
        end
        
        redirect_to group_index_path
    end
    
    
    def random
        Discussion.all.each do |discussion|
            teams = Team.where(:discussion_id => discussion.id)
            
            #This list holds two unpaired teams
            two_teams = []
            teams.each do |team|
                if !Group.has_team?(team.id, discussion.id)
                    two_teams.push(team.id)
                end
                if two_teams.length == 2
                    Group.create!({:team1_id => two_teams[0], :team2_id => two_teams[1], :discussion_id => discussion.id})
                    two_teams = []
                end
            end
        end
        redirect_to group_index_path
    end
end


