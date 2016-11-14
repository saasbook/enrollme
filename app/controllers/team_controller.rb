class TeamController < ApplicationController
  
  before_filter :set_user, :set_team
  before_filter :set_permissions, :except => ['index']
  before_filter :check_approved, :only => ['submit', 'unsubmit', 'edit']

  def index
    return redirect_to without_team_path if @team.nil?
    return redirect_to team_path(@team.id)
  end
  
  def show
    @discussions = Discussion.all
    render "team"
  end
  
  def submit
    redirect_to new_submission_path
  end
  
  def unsubmit
    @team.withdraw_submission
    redirect_to team_path(@team.id)
  end
  
  def edit
    @user_to_remove = User.find_by_id(params[:unwanted_user])
    @user_to_remove.leave_team
    
    return redirect_to without_team_path if @user_to_remove == @user
    
    notice = @team.submitted ? "Your team's submission has been withdrawn." : ""
    @team.withdraw_submission
    return redirect_to team_path(@team.id), notice: "Removed #{@user_to_remove.name} from team. " + notice
  end
  
  

  private
  
  def set_user
    @user = session[:is_admin] ? Admin.find(session[:user_id]) : User.find(session[:user_id]) 
  end

  def set_team
    @team = @user.team
  end

  def set_permissions
    target_team = Team.find_by_id(params[:id])
    # checking that the team we are looking for exists and that the user doing the action on the team is either an admin or a student on the same team
    if target_team.nil? or (session[:is_admin].nil? and target_team != @team)
      redirect_to '/', :notice => "Permission denied"
    end
  end
  
  def check_approved
    redirect_to '/', :notice => "Permission denied" if @team.approved
  end

  
  
  
end