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
      session[:user_id] = @user.id
      redirect_to without_team_path, :notice => "You signed up successfully!"
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
    @team = Team.create!(:passcode => @user.name + "'s team hash", :approved => false)
    @user.team = @team
    @team.users << @user
    flash[:notice] = "Successfully created a team!"
    redirect_to team_path(:id=>@team.id)
  end

  def join_team
    @team_passcode = params[:team_hash]
    if !!(@team_passcode.empty?) or !(Team.exists?(:passcode => @team_passcode))
      flash[:notice] = "Please enter a valid team passcode"
      redirect_to without_team_path
    else
      # TODO: when editing info, pre-fill in boxes
      # also when we integrate calnet, email/password box shouldn't be there
      # actually the user shouldn't be able to edit their info at all...
      # should be given by their calnet info
      # but while we have this, this page's button should be "Save changes", not "Create User"
      # probably best idea to get rid of this page completely
      @user = User.find(session[:user_id])
      @team = Team.find_by_passcode(@team_passcode)
      @user.team = @team
      @team.users << @user
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
