class TeamController < ApplicationController
    
  def index
    @user_id = session[:user_id]
    return redirect_to login_path if @user_id.nil?

    @user = User.find(@user_id)
    return redirect_to without_team_path if @user.team.nil?

    return redirect_to team_path(:id => @user.team.id)
  end
  
  def show
    # TODO : if team doesn't exist or user not supposed to access this, don't show, redirect to previous page
    @team = Team.find_by_id(params[:id])
    render "team"
  end
  
  def update
  end
  
  
end