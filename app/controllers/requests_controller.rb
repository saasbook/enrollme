class RequestsController < ApplicationController
    def request_params
        params.require([:user_id, :team_id])
    end

    def create
        Request.create!(request_params)
        redirect_to teams_path
    end
    
    def index
        @incoming_requests = Request.where(team_id: params[:team_id]).map{|request| request.user.name}
        @outgoing_requests = Request.where(user_id: params[:user_id]).map{|request| request.team.getMembers}
    end
    
    def destroy
    end
end
