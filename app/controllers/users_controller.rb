class UsersController < ApplicationController
  # before_filter :authenticate
  
  def new
    @user = User.new
    session[:user_id] = @user.id
    render 'new'
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      EmailStudents.welcome_email(@user).deliver_later
      
      session[:user_id] = @user.id
      redirect_to without_team_path, :notice => "You signed up successfully!"
    else
      render 'new', :notice => "Form is invalid"
    end
  end
  
  def edit
    @user = User.find session[:user_id]
    render 'edit'
  end
  
  def without
    return redirect_to login_path if session[:user_id].nil?
    
    @user = User.find(session[:user_id])
    render 'without'
  end

  def start_team
    @user = User.find(session[:user_id])
    @user.leave_team if !(@user.team.nil?)
    
    @team = Team.create!(:passcode => Team.generate_hash, :approved => false, :submitted => false)

    @user.team = @team
    @team.users << @user
    redirect_to team_path(:id=>@team.id)
  end

  def join_team
    @passcode = params[:team_hash]
    @team = Team.find_by_passcode(@passcode)
    return redirect_to without_team_path, :notice => "Unable to join team" if @passcode.empty? or @team.nil? or @team.approved
    
    @user = User.find(session[:user_id])
    @user.leave_team if !(@user.team.nil?)
    
    @user.team = @team
    @team.users << @user
    @team.withdraw_submission
    
    @team.send_submission_reminder_email if @team.eligible?
     
    redirect_to team_path(:id=>@team.id)
  end

  def update
    @user = User.find session[:user_id]
    @user.update_attributes!(user_params)
    @team = @user != nil ? @user.team : nil
    return redirect_to team_path({:id => @team === nil ? 1 : @team.id, :uid => @user.id})
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :sid, :major)
    end
end
