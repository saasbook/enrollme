class RequestsController < ApplicationController
    def request_params
        params.require([:user_id, :team_id])
    end

    def create
        request = Request.new(request_params)
    end
    
    def show
        @incoming_requests = Request.where(team_id: params[:team_id])
        @outgoing_requests = Request.where(user_id: params[:user_id])
    end
    
    def destroy
    end
end
