
class TeamController < ApplicationController
  
  before_filter :set_user, :set_team
  before_filter :set_permissions
  before_filter :check_approved, :only => ['submit', 'unsubmit', 'edit']
  
  def show
    puts "111111"
    puts Submission.all.inspect
    puts "111111"
    @discussions = Discussion.valid_discs_for(@team)
    if @team.submitted and !(@team.approved)
      @s = Submission.find(@team.submission_id)
      @d1 = Discussion.find(@s.disc1id)
      @d2 = Discussion.find_by_id(@s.disc2id)
      @d3 = Discussion.find_by_id(@s.disc3id)
    end
    render "team"
  end
  
  def submit
    #EmailStudents.successfully_submitted_email(@team).deliver_now
    
    redirect_to new_submission_path
  end
  
  def unsubmit
    puts "-------"
    puts @team.inspect
    puts "!!!!!!"
    puts Team.all.inspect
    puts Submission.all.inspect
    puts "======="
    @submission = @team.submission
    @submission.destroy!
    @team.withdraw_submission
    redirect_to team_path(@team.id)
  end
  
  def edit
    @user_to_remove = User.find_by_id(params[:unwanted_user])
    @user_to_remove.leave_team
    notice = ""

    if @user.is_a? Admin and @team.approved
      @team.disapprove
    elsif @team.submitted
      notice = " Your team's submission has been withdrawn."
    end

    @team.withdraw_submission
    return redirect_to without_team_path if @user_to_remove == @user
    return redirect_to team_path(@team.id), notice: "Removed #{@user_to_remove.name} from team." + notice
  end
  
  

  private
  
  def set_user
    if session[:is_admin]
      @user = Admin.find(session[:user_id])
    else
      @user = User.find(session[:user_id])
      redirect_to without_team_path, :notice => "Permission denied" if @user.team.nil?
    end
  end

  def set_team
    @team = Team.find_by_id(params[:id])
  end

  def set_permissions
    # checking that the team we are looking for exists and that the user doing the action on the team is either an admin or a student on the same team
    if @team.nil? or (session[:is_admin].nil? and @user.team != @team)
      redirect_to '/', :notice => "Permission denied"
    end
  end
  
  def check_approved
    redirect_to '/', :notice => "Permission denied" if @team.approved and !(@user.is_a? Admin)
  end

  
end