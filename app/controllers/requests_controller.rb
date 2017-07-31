class RequestsController < ApplicationController

    def create
        #If there is already a request with the same user id and team id, don't make a new one\
        if !Request.exists?({:team_id => params[:team_id], :user_id => params[:user_id]}) || Team.find_by({:id => params[:team_id]}).getNumMembers >= 6
            Request.create!(:team_id => params[:team_id], :user_id => params[:user_id])
            flash[:notice] = "Request Sent"
        end
        if Team.find_by({:id => params[:team_id]}).getNumMembers >= 6
            flash[:notice] = "Team is Full"
        end
        request = Request.create!(user_id: params[:user_id], target_id: params[:target_id], target_type: params[:target_type])
        #Send email out
        user = User.find(params[:user_id])
        targets = Request.find_by_user_id(params[:user_id]).target_users_list
        body = params[:body]
        EmailStudents.send_notify_emails(user, targets, body)
        flash[:notice] = "Request Sent"
        redirect_to team_list_path
    end

    def index
      #requests to my teams
        @incoming_requests = []
        #@incoming_requests = Request.where(target_type: "user").where(target_id: params[:user_id])
        @outgoing_requests = []
        #@incoming_to_team = Request.where(type: "team").where(target_id == users.find(params[:user_id]).team)
        #@incoming_requests = Request.where(team_id: User.find(params[:user_id]).team)
        #@outgoing_requests = Request.where(user_id: params[:user_id])
    end

    def accept
        user = User.find_by(user_id: params[:user_id])
        user.team_id = params[:team_id]
        user.save!
        flash[:notice] = "Request Approved"
        destroy
    end

    def deny
        flash[:notice] = "Request Denied"
        destroy
    end

    def destroy
        Request.delete(Request.find_by(team_id: params[:team_id], user_id: params[:user_id]))
        redirect_to user_requests_path
    end

    private
    def request_params
        #params.require(:user_id).require(:target_type).require(:target_id).permit(:body)
    end
end
