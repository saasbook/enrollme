class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate, :only => ['new', 'create']
  before_filter :check_is_user, :except => ['new', 'create', 'show', 'index',
                                            'import', 'destroy', 'edit']
  before_filter :set_user, :except => ['new', 'create']
  
  def index
    @users = User.all
  end
  
  def show
    puts Team.all.inspect
    @user = User.find_by_id(params[:id])
  end
  
  def new
    @user = User.new
    session[:user_id] = @user.id
    render 'new'
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      #EmailStudents.welcome_email(@user).deliver_later

      session[:user_id] = @user.id
      session[:user_email] = @user.email
      redirect_to without_team_path, :notice => "You signed up successfully!"
    else
      render 'new', :notice => "Form is invalid"
    end
  end
  
  def import
    if params[:file]
      User.import(params[:file])
      redirect_to users_path, notice: "Users Added Successfully"
    else
      redirect_to users_path, notice: "No File Selected"
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, 
                    notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start_team
    @user.leave_team if !(@user.team.nil?)
    
    @team = Team.create!(:passcode => Team.generate_hash, :approved => false, :submitted => false)

    @user.team = @team
    @team.users << @user
    redirect_to team_path(:id=>@team.id)
  end

  def join_team
    @passcode = params[:team_hash]
    @team = Team.find_by_passcode(@passcode)
    @team ||= Team.new()
    return redirect_to without_team_path, :notice => "Unable to join team" if @passcode.empty? or !(@team.can_join?)
    
    @user.leave_team if !(@user.team.nil?)
    
    @user.team = @team
    @team.users << @user
    @team.withdraw_submission
    
    @team.send_submission_reminder_email if @team.eligible?
     
    redirect_to team_path(:id=>@team.id)
  end

  def update
    @user.update_attributes!(user_params)
    @team = @user != nil ? @user.team : nil
    return redirect_to team_path({:id => @team === nil ? 1 : @team.id, :uid => @user.id})
  end

  private
  def check_is_user
    if session[:is_admin]
      session[:return_to] ||= request.referer
      return redirect_to session.delete(:return_to), :notice => 'Permission denied'
    end
  end
  
  def set_user
    if params[:id]
      @user = User.find_by_id params[:id]
    else
      @user = User.find_by_id session[:user_id]
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :sid, :major)
  end
end
