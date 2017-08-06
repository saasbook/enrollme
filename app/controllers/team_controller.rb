
class TeamController < ApplicationController
  

  
  before_filter :set_user, :set_team, :except => ['list', 'profile']
  before_filter :set_permissions, :except => ['list', 'profile']
  before_filter :check_approved, :only => ['submit', 'unsubmit', 'edit']
  
  
  def show
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
    EmailStudents.successfully_submitted_email(@team).deliver_now
    AdminMailer.send_look_at_submission
    
    redirect_to new_submission_path
  end
  
  def unsubmit
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
  
  def list
    sort = 'default'
    @waitlist_filter =['true', 'false']
    @num_members_filter = ['1', '2', '3', '4', '5', '6']
    
    ordering = {:users_count => :desc}
    
    @teams = Team.order(ordering)
  end

  def profile
    @team = Team.find_by_id(params[:id])
    @users_id = @team.users.map{|user| user.id}
    @users_name_arr = @team.getMembersNamesArray
    @users_time_arr = @team.getMembersTimeCommitmentArray
    @users_bio_arr = @team.getMembersBioArray
    @users_exp_arr = @team.getMembersExperiencesArray
    @users_fb_arr = @team.getMembersFacebookArray
    @users_lk_arr =@team.getMembersLinkedinArray
    @users_email_arr = @team.getMembersEmailsArray
    @users_pic_arr = @team.getMembersPicsArray
    @users_major_arr = @team.getMembersMajorArray
    @users_waitlist_arr = @team.getMembersWaitlistArray
    @users_days_arr = @team.getMembersDayArray
    @users_skills_arr = @team.getMembersSkillsArray
    # @discussions = Discussion.valid_discs_for(@team)
    # if @team.submitted and !(@team.approved)
    #   @s = Submission.find(@team.submission_id)
    #   @d1 = Discussion.find(@s.disc1id)
    #   @d2 = Discussion.find_by_id(@s.disc2id)
    #   @d3 = Discussion.find_by_id(@s.disc3id)
    # end
  end
  private
  
  def set_user
    if session[:is_admin]
      @user = Admin.find(session[:user_id])
    elsif session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to without_team_path, :notice => "Permission denied" if @user.team.nil?
    else
      redirect_to '/', :notice => "Please log in"
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