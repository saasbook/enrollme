class RequestsController < ApplicationController
    def request_params
        params.require(:team_id)
        params.require(:user_id)
        params.require(:target_type)
        #params.require(:request_id)
    end

    def new
        EmailStudents.notify_target_email()
    end

    def create
        #If there is already a request with the same user id and team id, don't make a new one\
        # if !Request.exists?({:team_id => params[:team_id], :user_id => params[:user_id]}) || Team.find_by({:id => params[:team_id]}).getNumMembers >= 6
        #     Request.create!(:team_id => params[:team_id], :user_id => params[:user_id])
        #     flash[:notice] = "Request Sent"
        # end
        # if Team.find_by({:id => params[:team_id]}).getNumMembers >= 6
        #     flash[:notice] = "Team is Full"
        # end
        request = Request.create!(user_id: params[:user_id],
                                  target_id: params[:target_id],
                                  target_type: params[:target_type])
        #Send email out
        user = User.find(params[:user_id])
        targets = Request.find(params[:user_id]).target_users_list()
        body = params[:body]
        EmailStudents.notify_email(user, targets, body)
        redirect_to team_list_path
    end
    
    def index
        @incoming_requests = Request.where(team_id: User.find(params[:user_id]).team)
        @outgoing_requests = Request.where(user_id: params[:user_id])
    end
    
    def accept
    end
    
    def deny
        flash[:notice] = "Request Denied"
        destroy
    end
    
    def destroy
        Request.delete(Request.find_by(team_id: params[:team_id], user_id: params[:user_id]))
        redirect_to user_requests_path
    end
end
