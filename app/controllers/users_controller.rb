class UsersController < ApplicationController

  skip_before_filter :authenticate, :only => ['new', 'create']
  before_filter :check_is_user, :except => ['new', 'create', 'show']
  before_filter :set_user, :except => ['new', 'create']
  
  def show
    @user = User.find_by_id(params[:id])
    @availableDays = @user.getAvailableDays
    @skills = @user.getSkills
  end
  
  def new
    @user = User.new
    session[:user_id] = @user.id
    render 'new'
  end
  
  def create
    @user = User.new(user_params)
    @user.schedule = Schedule.new(schedule_params)
    @user.skill_set = SkillSet.new(skill_set_params)
    
    if @user.save
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      redirect_to without_team_path, :notice => "You signed up successfully!"
      # send a confirmation email
      EmailStudents.welcome_email(@user).deliver_now

    else
      render 'new', :notice => "Form is invalid"
    end
  end

  def start_team
    @user.leave_team if !(@user.team.nil?)
    
    @team = Team.new(:passcode => Team.generate_hash, :approved => false, :submitted => false)

    @team.users << @user
    @team.update_waitlist
    @user.team = @team
    redirect_to team_path(:id=>@team.id)
  end

  def join_team
    @passcode = params[:team_hash]
    @team = Team.find_by_passcode(@passcode)
    @team ||= Team.new()
    return redirect_to without_team_path, :notice => "Unable to join team" if @passcode.empty? or !(@team.can_join?)
    
    @user.leave_team if !(@user.team.nil?)

    @team.users << @user
    @team.update_waitlist
    @user.team = @team
    @team.withdraw_submission
    
    @team.send_submission_reminder_email if @team.eligible?
     
    redirect_to team_path(:id=>@team.id)
  end

  def update
    @user.update_attributes!(user_params)
    if @user.team
      @user.team.update_waitlist
    end
    @team = @user != nil ? @user.team : nil
    return redirect_to user_path #team_path({:id => @team === nil ? 1 : @team.id, :uid => @user.id})
  end
  
  def index

    sort = params[:users_sort] || session[:users_sort] || 'default'
    search = params[:search] || session[:search] || ''

    if sort.include?('in_team?') || sort.include?('team_id')
      users_sort = 'team_id asc'
    else
      users_sort = 'name asc'
    end


    if search != ''
      @users = User.where("name LIKE ?", "%#{search}%")
    else
      @users = User.all
    end

    session[:users_sort] = users_sort
    session[:search] = search
    @users = @users.order(users_sort)
  
  end


  private
  def check_is_user
    if session[:is_admin]
      session[:return_to] ||= request.referer
      return redirect_to session.delete(:return_to), :notice => 'Permission denied'
    end
  end
  
  def set_user
    @user = User.find_by_id session[:user_id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :sid, :major, :waitlisted, :bio, :time_commitment, :experience, :facebook, :linkedin, :schedule, :skill_set, :avatar,:document)
  end

  def schedule_params
    params.require(:user).require(:schedule).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end

  def skill_set_params
    params.require(:user).require(:skill_set).permit(:ruby_on_rails, :other_backend, :frontend, :ui_design, :team_management)
  end
end
