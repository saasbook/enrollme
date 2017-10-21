class GroupController < ApplicationController
    
    def index
        status = params[:status]
        @status = status
        @teams_li = Team.filter_by(status)
        render 'index'
    end
end
