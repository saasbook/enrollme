class RequestsController < ApplicationController
    
    before_filter :set_user_and_team
    
    def new
        #Make a new request, redirect immediately if size errors
        @target_id = params[:target_id]
        @source_id = @team.id
        if Team.find_by(id: @target_id).getNumMembers + Team.find_by(id: @source_id).getNumMembers > Option.maximum_team_size
            redirect_to team_list_path, flash: {alert: "The team you have requested to cannot accomodate everyone on your team. Please select another team."}
            return
        end
      
        # render partial to send email to the members of a team
        # ajax call to render partial
        render :partial => 'request', :object => @target_id and return if request.xhr?                                                         
      
        # calls team#index
        redirect_to team_list_path
    end


    def create
        #Create the request under the current user
        @request = @team.requests.find_or_create_by(source_id: params[:source_id], target_id: params[:target_id])

        #Check for errors, send it to the flash
        if @request.errors.any?
            ######NEEDS TO BE CHANGED TO PREVIOUS PAGE###############
            redirect_to team_list_path, flash: {alert: "Your request is no longer valid. Please select another team."}
        else
        #Send email out
            target_users = @request.target_users_list
            body = params[:request][:content]
            RequestsMailer.send_notify_emails(@user, target_users, body)
            ######NEEDS TO BE CHANGED TO PREVIOUS PAGE###############
            redirect_to team_list_path, flash: {alert: "Your request has been sent successfully."}
        end
    end

    def email_team
    # render partial to send email to the members of a team
        @team_id = params[:target_id]
        render :partial => 'email_team', :object => @team_id and return if request.xhr?
        render 'index'
    end

    def index
        #requests to me
        reqs_to_me = Request.where(target_id: @team.id)
        @requests_to_me = (reqs_to_me) ? reqs_to_me.map {|request| {text: request.showSources, id: request.id}} : []
        
        #requests from me or my team
        reqs_from_me = Request.where(source_id: @team.id)
        @requests_from_me = (reqs_from_me) ? reqs_from_me.map {|request| {text: request.showTargets, id: request.id}} : []
    end


    def destroy
        if !Request.exists?(params[:id])
          flash[:notice] = "This request was already processed"
          return redirect_to user_requests_path
        end
        request = Request.find_by(id: params[:id])
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
    def set_user_and_team
        @user = User.find_by_id session[:user_id]
        @team = @user.team
    end
    
    def request_params
        #params.require(:target_type).require(:target_id).permit(:body, :user_id)
    end
end
