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
        @user = User.find(session[:user_id])
        #requests to me or my team
        reqs_to_me = Request.where(target_type: "user").where(target_id: @user.id)
        @requests_to_me = (reqs_to_me) ? reqs_to_me.map {|request| {text: request.showSources, id: request.id}} : []
        reqs_to_my_team = Request.where(target_type: "team").where(target_id: @user.team_id)
        @requests_to_my_team = (reqs_to_my_team) ? reqs_to_my_team.map {|request| {text: request.showSources, id: request.id}} : []

        #requests from me or my team
        reqs_from_me = Request.where(user_id: @user.id)
        @requests_from_me = (reqs_from_me) ? reqs_from_me.map {|request| {text: request.showTargets, id: request.id}} : []
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
        if !Request.exists?(params[:id])
          flash[:notice] = "This request was already processed"
          return redirect_to user_requests_path
        end
        request = Request.find(params[:id])
        if params[:decision] == "accept"
            request.join
            request.destroy
            flash[:notice] = "Request Approved"
        elsif params[:decision] == "deny"
            request.destroy
            flash[:notice] = "Request Denied"
        elsif params[:decision] == "cancel"
            request.destroy
        end
        redirect_to user_requests_path
    end

    private
    def request_params
        #params.require(:target_type).require(:target_id).permit(:body, :user_id)
    end
end
