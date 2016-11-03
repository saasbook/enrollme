class TeamController < ApplicationController
    
  def index
    # TODO: can refactor index and show, also join/leave team in user controller
    @user_id = session[:user_id]
    return redirect_to login_path, :notice => "Please log in" if @user_id.nil?
    
    return redirect_to admin_path(@user_id) if session[:is_admin]
    
    @user = User.find(@user_id)
    return redirect_to without_team_path, :notice => "Your team does not exist" if @user.team.nil?

    return redirect_to team_path(:id => @user.team.id)
  end
  
  def show

    @user = User.find_by_id(session[:user_id])
    return redirect_to login_path, :notice => "Please log in" if @user.nil?
    
    return redirect_to admin_path(@user.id) if session[:is_admin]

    return redirect_to without_team_path, :notice => "Your team does not exist" if @user.team.nil?
    
    @team = Team.find_by_id(params[:id])
    
    @discussions = Discussion.all
    
    return redirect_to '/', notice: "This team does not exist" if @team.nil?
  
    return redirect_to team_path(:id => @user.team.id), notice: "Cannot access this team" if @user.team != @team

    render "team"
  end
  
  def leave
    User.find(session[:user_id]).leave_team
    return redirect_to without_team_path
  end
  
  def edit
    @user = User.find_by_id(session[:user_id])
    @user_to_remove = User.find(params[:unwanted_user])

    if @user.team == @user_to_remove.team
      @user_to_remove.leave_team
      return redirect_to '/', notice: "Removed " + @user_to_remove.name + " from team."
    else
      return redirect_to '/', notice: "Removal failed"
    end
  end
  
  def submit
    @team = Team.find_by_id(params[:id])
    
  end
end