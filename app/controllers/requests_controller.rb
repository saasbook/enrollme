class RequestsController < ApplicationController

    def new
        #Redirect immediately if team is full
        if params[:target_type] == "team"
           team = Team.find(params[:target_id])
           if team.isFull?
               redirect_to team_list_path, flash: {alert: "The team you have requested to join is full. Please select another team."}
            end
        end
    end
    
    def create
        #Create the request under the current user
        @user = User.find(session[:user_id])
        @request ||= @user.requests.create(target_id: params[:target_id], target_type: params[:target_type])
        
        #Check for errors, send it to the flash
        if @request.errors.any?
            ######NEEDS TO BE CHANGED TO PREVIOUS PAGE###############
            redirect_to team_list_path, flash: {alert: "Your request is no longer valid. Please select another #{params[:target_type]}."}
        else
        #Send email out
            target_users = @request.target_users_list
            body = params[:body]
            EmailStudents.send_notify_emails(@user, target_users, body)
            ######NEEDS TO BE CHANGED TO PREVIOUS PAGE###############
            redirect_to team_list_path, flash: {alert: "Your request has been sent successfully."}
        end
    end

    def index
      #requests to my teams
        @user = User.find(session[:user_id])
        @incoming_requests_from_users = Array(Request.where(target_type: "user").where(target_id: @user.id))
        @incoming_requests_from_users = @incoming_requests_from_users.map {|request| User.find(request.target_id)}
        
        @incoming_requests_from_teams = Array(Request.where(target_type: "team").where(target_id: @user.team.id))
        @incoming_requests_from_teams = @incoming_requests_from_teams.map {|request| Team.find(request.target_id)}
        
        @outgoing_requests_to_users = Array(Request.where(target_type: "user").where(user_id: @user.id))
        @outgoing_requests_to_users = @outgoing_requests_to_users.map {|request| User.find(request.target_id)}
        
        @outgoing_requests_to_teams = Array(Request.where(target_type: "team").where(user_id: @user.team.id))
        @outgoing_requests_to_teams = @outgoing_requests_to_teams.map {|request| Team.find(request.target_id)}
    end
    
=begin
    def accept
        Request.join(sender, target_type, receiver)
        if check e
        flash[:notice] = "Request Approved"
        destroy
    end

    def deny
        flash[:notice] = "Request Denied"
        destroy
    end
=end

    def destroy
        if params[:decision] == "accept"
            Request.join(session[:user_id], params[:target_type], params[:target_id])
            Request.find(params[:id]).destroy
        elsif params[:decision] == "deny"
            Request.find(params[:id]).destroy
        elsif params[:decision] == "cancel"
            Request.find(params[:id]).destroy
        end
        redirect_to user_requests_path
    end

    private
    def request_params
        #params.require(:target_type).require(:target_id).permit(:body, :user_id)
    end
end
