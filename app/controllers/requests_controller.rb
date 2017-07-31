class RequestsController < ApplicationController

    def new
        #@user = User.find(session[:user_id])
        #@request ||= @user.requests.new
    end
    
    def create
        #Create the request under the current user
        @user = User.find(session[:user_id])
        @request ||= @user.requests.create(target_id: params[:target_id], target_type: params[:target_type])
        
        #Check for errors, send it to the flash
        if @request.errors.any?
            ######NEEDS TO BE CHANGED TO PREVIOUS PAGE###############
            redirect_to team_list_path, flash: {notice: "Your request is no longer valid. Please select another #{params[:target_type]}."}
        else
        #Send email out
            target_users = @request.target_users_list
            body = params[:body]
            EmailStudents.send_notify_emails(@user, target_users, body)
            ######NEEDS TO BE CHANGED TO PREVIOUS PAGE###############
            redirect_to team_list_path, flash: {notice: "Your request has been sent successfully."}
        end
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
        params.require(:target_type).require(:target_id).permit(:body, :user_id)
    end
end
