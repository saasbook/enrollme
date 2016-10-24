class TeamController < ApplicationController
  def index
    @user_id = session[:user_id]
    return redirect_to login_path if @user_id.nil?
    
    # @user = User.find_by_id(@user_id)
    # return redirect_to login_path if @user.nil?
    
    @user = User.find(@user_id)
    
    return redirect_to without_team_path, :notice => "Your team does not exist" if @user.team.nil?

    return redirect_to team_path(:id => @user.team.id)
  end

  def show
    @team = Team.where(:id => params[:id]).first
    return redirect_to '/', notice: "This team does not exist" if @team.nil?

    @user_id = session[:user_id]
    return redirect_to login_path if @user_id.nil?

    @user = User.find(@user_id)
    return redirect_to without_team_path, :notice => "Your team does not exist" if @user.team.nil?
  
    return redirect_to team_path(:id => @user.team.id), notice: "Cannot access this team" if @user.team != @team

    render "team"
  end

  def leave
    User.find(session[:user_id]).leave_team
    return redirect_to without_team_path
  end

  def update
  end
end
