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
      # send welcome email after save
      UserMailer.welcome_email(@user).deliver_later
      
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
    
    render 'without'
  end

  def start_team
    @user = User.find(session[:user_id])
    @user.leave_team if !(@user.team.nil?)
    
    @team = Team.create!(:passcode => Team.generate_hash, :approved => false, :submitted => true)

    @user.team = @team
    @team.users << @user
    redirect_to team_path(:id=>@team.id)
  end

  def join_team
    # TODO: How to make all other views use application view for header?
    @user = User.find(session[:user_id])
    @user.leave_team if !(@user.team.nil?)
    
    @team = Team.find_by_passcode(params[:team_hash])

    @user.team = @team
    @team.users << @user
    
    if @team.users.length == 5 or @team.users.length == 6
      @team.users.each do |user|
        UserMailer.submit_email(user).deliver_later
      end
    end
    
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
