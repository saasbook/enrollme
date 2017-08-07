class RequestsController < ApplicationController
    
    before_filter :set_user_and_team
    
    def new
        #Make a new request, redirect immediately if size errors
        @target_id = params[:target_id]
        @source_id = @team.id
        source = Team.find_by(id: @source_id)
        target = Team.find_by(id: @target_id)
        #Immediately throw errors if the size will be too big or if an attempt to request self
        if target.getNumMembers + source.getNumMembers > Option.maximum_team_size
           @error_message = "The team you have requested to cannot accomodate everyone on your team. Please select another team."
           render :partial => 'invalid_request' and return if request.xhr?
        elsif target.id == source.id
            @error_message = "The team you have requested is your own team. Please select another team."
            render :partial => 'invalid_request' and return if request.xhr?
        else
            # render partial to send email to the members of a team
            render :partial => 'request', :object => @target_id and return if request.xhr?
        end
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
        target = Team.find_by(id: request.target_id)
        source = Team.find_by(id: request.source_id)
        #If the new size is going to be too big, redirect back
        if params[:decision] == "accept"
            if target.getNumMembers + source.getNumMembers > Option.maximum_team_size
                request.destroy
                flash[:notice] = "This request is no longer valid"
            else
                request.join(source, target)
                request.destroy
                flash[:notice] = "Request Approved"
            end
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
