class UserController < ApplicationController
  # before_filter :authenticate
  
  def new
    #TODO: REMEMBER TO CHECK WEN SOMEONE CREATES A NEW USER THAT THE USER DOESNT ALREAY EXIST
    @user = User.new
    session[:user_id] = @user.id
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You signed up successfully!"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def without
    if session[:user_id].nil?
      redirect_to login_path
    else
    	render :layout => "layouts/without"
    end
  end

  def start_team
    # TODO: function in team_controller to generate team hashes
    @user = User.find(session[:user_id])
    @user.team = Team.create!(:passcode => @user.name + "'s team hash", :approved => false)
    redirect_to team_path(:id=>@user.team.id)
  end

  def join_team
    @team_passcode = params[:team_hash]
    if !!(@team_passcode.empty?) or !(Team.exists?(:passcode => @team_passcode))
      flash[:notice] = "Please enter a valid team passcode"
      redirect_to without_team_path
    else
      # TODO: on team page, only show current user's team
      # if user not logged in, redirect to login page
      # if user not on a team, redirect to without_team page
      flash[:notice] = "Successfully created a team!"
      @user = User(session[:user_id])
      @team = Team.find_by_passcode(@team_passcode)
      @user.team = @team
      redirect_to team_path(:id=>@team.id)
    end
    
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(movie_params)
    @team = @user != nil ? @user.team : nil
    return redirect_to team_path({:id => @team === nil ? 1 : @team.id, :uid => user_id})
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :team, :sid, :major)
    end


end
