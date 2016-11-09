class SubmissionsController < ApplicationController
    
    def new
        @submission = Submission.new
        render 'new'
    end
    
    def create
        @user = User.find_by_id(session[:user_id])
        @team = Team.find_by_id(@user.team.id)
        @submission = Submission.new(submission_params)
        @submission.save!
        # TODO : email that submission has been created?
        @team.update(submitted: true)
        return redirect_to team_path(@team), notice: "Thanks for submitting your team for enrollment."
    end
    
    def destroy
        
    end

    private
        def submission_params
            params.require(:submission).permit(:disc1id, :disc2id, :disc3id)
        end
end