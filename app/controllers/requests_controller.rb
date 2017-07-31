class RequestsController < ApplicationController
    def request_params
        params.require(:team_id)
        params.require(:user_id)
    end

    def create
        #If there is already a request with the same user id and team id, don't make a new one\
        if !Request.exists?({:team_id => params[:team_id], :user_id => params[:user_id]}) || Team.find_by({:id => params[:team_id]}).getNumMembers >= 6
            Request.create!(:team_id => params[:team_id], :user_id => params[:user_id])
            flash[:notice] = "Request Sent"
        end
        if Team.find_by({:id => params[:team_id]}).getNumMembers >= 6
            flash[:notice] = "Team is Full"
        end
        #Also check if team is full
        redirect_to team_list_path
    end
    
    def send_email_to_user
        user = User.find_by(id: params[:user_id])
        if user
            RequestsMailer.send_email_to_user(user).deliver
        else 
            flash[:notice] = "Oops! That user wasn't found."
        end
    end

    def email_team
    # render partial to send email to the members of a team
        @team_id = params[:team_id]
        render :partial => 'email_team', :object => @team_id and return if request.xhr?                                                         
        render 'index'
    end

    def index
        @incoming_requests = Request.where(team_id: params[:team_id])
        @outgoing_requests = Request.where(user_id: params[:user_id])
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
end
